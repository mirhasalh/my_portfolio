import 'package:flutter/material.dart';

// Using the seedColor as a starting point, a set of tonal palettes are
// constructed. These tonal palettes are based on the Material 3 Color
// system and provide all the needed colors for a [ColorScheme]. These
// colors are designed to work well together and meet contrast requirements
// for accessibility.
const kSeedColor = Colors.purple;

// This is the theme of your application.
//
// Try running your application with "flutter run". You'll see the
// application has a blue toolbar. Then, without quitting the app, try
// changing the primarySwatch below to Colors.green and then invoke
// "hot reload" (press "r" in the console where you ran "flutter run",
// or simply save your changes to "hot reload" in a Flutter IDE).
// Notice that the counter didn't reset back to zero; the application
// is not restarted.
final theme = ThemeData.light(useMaterial3: true).copyWith(
    colorScheme: ColorScheme.fromSeed(
  seedColor: kSeedColor,
  brightness: Brightness.light,
));

final darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    colorScheme: ColorScheme.fromSeed(
  seedColor: kSeedColor,
  brightness: Brightness.dark,
));
