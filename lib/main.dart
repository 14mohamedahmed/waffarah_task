import 'package:flutter/material.dart';
import 'package:waffaraha_task/app_routing/app_router.dart';
import 'package:waffaraha_task/app_routing/route_names.dart';
import 'package:waffaraha_task/core/services/services_locator.dart';
import 'package:waffaraha_task/core/utils/app_theme.dart';

import 'core/services/navigation_service.dart';

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
      navigatorKey: getIt<NavigationService>().navigatorKey,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: RouteNames.photosPage,
    );
  }
}
