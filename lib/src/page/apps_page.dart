import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/src/page/pages.dart';
import 'package:my_portfolio/src/providers/providers.dart';
import 'package:my_portfolio/src/providers/theme_provider.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/foundation.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:go_router/go_router.dart';

import '../common.dart';
import '../constants.dart';
import '../model/project.dart';

class AppsPage extends ConsumerStatefulWidget {
  const AppsPage({super.key});

  @override
  ShowcasesPageState createState() => ShowcasesPageState();
}

class ShowcasesPageState extends ConsumerState<AppsPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final projects = ref.watch(projectsProvider);
    final colors = Theme.of(context).colorScheme;
    final b = Theme.of(context).brightness.name;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          kToolbarHeight,
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: AppBar(
              title: Text(l10n.myApps),
              elevation: 0.0,
              backgroundColor: colors.surface.withAlpha(240),
              actions: [
                IconButton(
                  onPressed: () => _showThemeSettings(),
                  icon: Icon(b == 'dark' ? Icons.dark_mode : Icons.light_mode),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    if (kIsWeb) {
                      html.window.open(
                        kDropboxUrl,
                        '_blank',
                      );

                      return;
                    }

                    _launchUrl(kDropboxUrl);
                  },
                  title: Text(l10n.downloadApk),
                  leading: const Icon(Icons.android),
                  subtitle: Text(l10n.downloadApkSubtitle),
                ),
                ListTile(
                  onTap: () {
                    if (kIsWeb) {
                      html.window.open(
                        kGitRepoUrl,
                        '_blank',
                      );

                      return;
                    }

                    _launchUrl(kGitRepoUrl);
                  },
                  title: const Text('GitHub'),
                  leading: SvgPicture.asset(
                    kGitHubIcon,
                    colorFilter: ColorFilter.mode(
                      colors.onSurfaceVariant,
                      BlendMode.srcIn,
                    ),
                  ),
                  subtitle: Text(l10n.githubSubtitle),
                ),
              ],
            ),
          ),
        ),
      ),
      body: projects.when(
        data: (data) => ListView(
          padding: const EdgeInsets.symmetric(
            vertical: 40.0 + kToolbarHeight,
            horizontal: 6.0,
          ),
          children: [
            StaggeredGrid.count(
              crossAxisCount: _getAxisCount(MediaQuery.of(context).size.width),
              mainAxisSpacing: 6.0,
              crossAxisSpacing: 6.0,
              children: List.generate(
                data.length,
                (index) => _Project(
                  id: '${data[index].id}',
                  src: data[index].image,
                  title: data[index].title,
                  initialCommit: data[index].init,
                  projectStatus: data[index].status,
                  onTap: () {
                    var split = Uri.parse(data[index].image).path.split('/');

                    final path2 = split.last;
                    final path = split[split.length - 2];

                    final location = context.namedLocation(
                      ViewImagePage.routeName,
                      pathParameters: {'path': path, 'path2': path2},
                    );

                    context.go(location);
                  },
                  onTapInfo: () => _showInfo(data[index]),
                ),
              ),
            ),
          ],
        ),
        error: (_, __) => const Center(child: CupertinoActivityIndicator()),
        loading: () => const SizedBox.shrink(),
      ),
    );
  }

  int _getAxisCount(double width) {
    if (width >= 800) {
      return 4;
    } else if (width >= 600) {
      return 3;
    } else {
      return 2;
    }
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.platformDefault,
        webViewConfiguration: const WebViewConfiguration(
          enableJavaScript: true,
          enableDomStorage: true,
        ))) {
      throw 'Could not launch $url';
    }
  }

  void _showInfo(Project project) {
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const _DragHandler(),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(project.desc, style: textTheme.bodyLarge),
                Text(
                  'Description',
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const Divider(height: 0.0),
          ListTile(
            title: Text(project.title),
            subtitle: Text(l10n.projectTitle),
          ),
          const Divider(height: 0.0),
          ListTile(
            title: Text(
                project.type == 2 ? l10n.associatedWithCompany : 'Personal'),
            subtitle: Text(l10n.type),
          ),
          const Divider(height: 0.0),
          ListTile(
            title: Text(project.status),
            subtitle: const Text('Status'),
          ),
          const Divider(height: 0.0),
          ListTile(
            title: Text(project.init),
            subtitle: const Text('Initial commit'),
          ),
          const Divider(height: 0.0),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(_techStackFormat(project.techStack),
                    style: textTheme.bodyLarge),
                Text(
                  l10n.techStack,
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _techStackFormat(String text) {
    final l10n = AppLocalizations.of(context)!;

    if (text == 'n/a') {
      return l10n.uiOnly;
    }

    var split = text.split(',');

    return split.join(', ');
  }

  void _showThemeSettings() {
    final themeMode = ref.watch(themeProvider).themeMode;
    final nav = Navigator.of(context);

    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const _DragHandler(),
          ...ThemeMode.values.map(
            (v) => RadioListTile(
              value: v,
              groupValue: themeMode,
              onChanged: (v) {
                ref.read(themeProvider).setThemeMode(v!);
                nav.pop();
              },
              title: Text(t(v.name)),
            ),
          ),
        ],
      ),
    );
  }

  String t(String name) {
    final l10n = AppLocalizations.of(context)!;

    switch (name) {
      case 'system':
        return l10n.system;
      case 'light':
        return l10n.light;
      case 'dark':
        return l10n.dark;
      default:
        return 'n/a';
    }
  }
}

class _Project extends StatelessWidget {
  const _Project({
    required this.id,
    required this.src,
    required this.title,
    required this.initialCommit,
    required this.projectStatus,
    required this.onTap,
    required this.onTapInfo,
  });

  final String id;
  final String src;
  final String title;
  final String initialCommit;
  final String projectStatus;
  final VoidCallback onTap;
  final VoidCallback onTapInfo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(9.0),
                child: Hero(
                  tag: Uri.parse(src).path.replaceAll(RegExp(r'/'), ''),
                  child: kIsWeb
                      ? Image.network(src)
                      : FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: src,
                        ),
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: onTapInfo,
            icon: const Icon(
              Icons.info_outline,
              color: Colors.white70,
            ),
            tooltip: 'Info',
          ),
        ],
      ),
    );
  }
}

class _DragHandler extends StatelessWidget {
  const _DragHandler();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 4.0,
            width: 60.0,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(9.0),
            ),
          ),
        ],
      ),
    );
  }
}
