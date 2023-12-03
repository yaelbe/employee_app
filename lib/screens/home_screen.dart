import 'package:flutter/material.dart';
import '../models/app_config.dart';

class HomeScreen extends StatelessWidget {
  final AppConfig config;

  const HomeScreen({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(config.appName),

      ),
      body: Center(
        child: Image.asset(config.logoPath),
      ),
    );
  }
}
