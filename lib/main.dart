import 'package:flutter/material.dart';
import 'package:waffaraha_task/core/services/services_locator.dart';
import 'package:waffaraha_task/core/utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupSingeltonServices();
  runApp(const WaffarahTaskApp());
}

class WaffarahTaskApp extends StatelessWidget {
  const WaffarahTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waffaraha Task',
      theme: AppTheme.defaultTheme(context),
    );
  }
}
