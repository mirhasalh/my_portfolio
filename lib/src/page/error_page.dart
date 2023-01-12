import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, required this.error});

  final String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('404. Page was not found.'),
            const SizedBox(height: 8.0),
            Text(error, style: Theme.of(context).textTheme.caption),
          ],
        ),
      ),
    );
  }
}
