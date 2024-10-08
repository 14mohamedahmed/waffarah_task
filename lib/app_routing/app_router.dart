import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waffaraha_task/app_routing/route_names.dart';
import 'package:waffaraha_task/app_routing/routing_data.dart';
import 'package:waffaraha_task/core/services/services_locator.dart';
import 'package:waffaraha_task/features/photos/presentation/controller/photos_bloc.dart';
import 'package:waffaraha_task/features/photos/presentation/screen/photos_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var uriData = Uri.parse(settings.name!);

    var routingData = RoutingData(
      queryParameters: uriData.queryParameters,
      route: uriData.path,
    );

    // ignore: unused_local_variable
    Map<String, dynamic> parameters = {};

    if (settings.arguments != null) {
      parameters = settings.arguments as Map<String, dynamic>;
    }

    switch (routingData.route) {
      case RouteNames.photosPage:
        return _getPageRoute(
          BlocProvider<PhotosBloc>(
            create: (context) => getIt<PhotosBloc>()..add(GetPhotosEvent()),
            child: const PhotosScreen(),
          ),
          settings,
        );
      default:
        return _getPageRoute(Container(), settings);
    }
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget? child;
  final String? routeName;

  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child!,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
