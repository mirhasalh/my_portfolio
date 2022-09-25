import 'package:flutter/material.dart';
import 'package:my_portfolio/my_portfolio.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  // TODO: Set url strategy to remove the leading hash symbol
  setPathUrlStrategy();
  runApp(const MyPortfolio());
}
