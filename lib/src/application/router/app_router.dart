import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:standered_application/src/application/router/app_routes.dart';
import 'package:standered_application/src/application/router/custom_navigation_observer.dart';
import 'package:standered_application/src/application/router/fallback_screen.dart';

final GlobalKey<NavigatorState> rootKey = GlobalKey<NavigatorState>();

// class AppRouter {
//   final GoRouter goRouter;

//   AppRouter() : goRouter = _getRouter;

//   static late AppRouter _appRouter;

//   static init() {
//     _appRouter = AppRouter();
//   }

//   static get getRouter => _appRouter.goRouter;
//   static get _getRouter => GoRouter(
//       navigatorKey: rootKey,
//       initialLocation: AppRoutes.initScreen,
//       observers: [CustomNavigationObserver()],
//       errorBuilder: (context, state) => const FallbackScreen(),
//       routes: <RouteBase>[
//         GoRoute(
//           path: AppRoutes.initScreen,
//           parentNavigatorKey: rootKey,
//           builder: (BuildContext context, GoRouterState state) {
//             return Scaffold(
//               body: Container(
//                 color: Colors.grey,
//               ),
//             );
//           },
//         ),
//       ]);
// }
class AppRouter {
  static final _router = AppRouter._internal();

  factory AppRouter() => _router;

  final GoRouter goRouter;

  AppRouter._internal() : goRouter = _createRouter();

  static GoRouter _createRouter() {
    return GoRouter(
      navigatorKey: rootKey,
      initialLocation: AppRoutes.initScreen,
      observers: [CustomNavigationObserver()],
      errorBuilder: (context, state) => const FallbackScreen(),
      routes: <RouteBase>[
        GoRoute(
          path: AppRoutes.initScreen,
          parentNavigatorKey: rootKey,
          builder: (BuildContext context, GoRouterState state) {
            return Scaffold(
              body: Container(
                color: Colors.grey,
              ),
            );
          },
        ),
      ],
    );
  }
}
