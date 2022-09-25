import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Folio'),
        ),
        body: Wrap(
          children: [
            Container(
              color: Colors.red,
              height: 100.0,
              width: 100.0,
            ),
            Container(
              color: Colors.purple,
              height: 100.0,
              width: 300.0,
            ),
            Container(
              color: Colors.green,
              height: 100.0,
              width: 100.0,
            ),
          ],
        ));
  }
}
