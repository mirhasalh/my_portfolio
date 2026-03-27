import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id'),
  ];

  /// A title for apps page
  ///
  /// In en, this message translates to:
  /// **'Irhas\'s portfolio'**
  String get appTitle;

  /// A title for apps page
  ///
  /// In en, this message translates to:
  /// **'My apps'**
  String get myApps;

  /// A title for download apk button
  ///
  /// In en, this message translates to:
  /// **'Download APK'**
  String get downloadApk;

  /// A subtitle for download apk button
  ///
  /// In en, this message translates to:
  /// **'Download APK via Dropbox'**
  String get downloadApkSubtitle;

  /// A subtitle for GitHub button
  ///
  /// In en, this message translates to:
  /// **'View source code on GitHub'**
  String get githubSubtitle;

  /// A subtitle for description list tile
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get desc;

  /// A subtitle for type list tile
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// A subtitle for tech stack list tile
  ///
  /// In en, this message translates to:
  /// **'Tech stack'**
  String get techStack;

  /// A title for tech status list tile
  ///
  /// In en, this message translates to:
  /// **'Associated with company'**
  String get associatedWithCompany;

  /// A title for project title list tile
  ///
  /// In en, this message translates to:
  /// **'Project title'**
  String get projectTitle;

  /// A title for tech stack list tile
  ///
  /// In en, this message translates to:
  /// **'UI kit only'**
  String get uiOnly;

  /// A title for system list tile
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// A title for light list tile
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// A title for dark list tile
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// A title for go to source code list tile
  ///
  /// In en, this message translates to:
  /// **'Go to source code'**
  String get goToSourceCode;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'id':
      return AppLocalizationsId();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
