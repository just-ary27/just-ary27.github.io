import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/who/who.dart';
import '../pages/work/work.dart';
import '../pages/blog/blog.dart';
import '../pages/home/home.dart';
import '../handlers/route_handler.dart';
import '../pages/application_shell.dart';

GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: "Opener Router Used",
);

GlobalKey<NavigatorState> _siteNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: "Site Router Used",
);

class RouteManager {
  static Color currentColor = Colors.black;
}

GoRouter router = GoRouter(
  // navigatorKey: _rootNavigatorKey,
  initialLocation: RouteHandler.homePage,
  routes: [
    ShellRoute(
      navigatorKey: _siteNavigatorKey,
      builder: (
        BuildContext context,
        GoRouterState state,
        Widget child,
      ) {
        return ApplicationShell(child: child);
      },
      routes: <RouteBase>[
        GoRoute(
          path: RouteHandler.homePage,
          // navigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) {
            RouteManager.currentColor = RouteHandler.homeColor;
            return CustomTransitionPage(
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = 0.00;
                const end = 1.00;
                const curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(
                  CurveTween(curve: curve),
                );

                return FadeTransition(
                  opacity: animation.drive(tween),
                  child: child,
                );
              },
              transitionDuration: const Duration(milliseconds: 750),
              child: const HomePage(),
            );
          },
        ),
        GoRoute(
          path: RouteHandler.whoPage,
          // parentNavigatorKey: _siteNavigatorKey,
          pageBuilder: (context, state) {
            RouteManager.currentColor = RouteHandler.whoColor;
            return CustomTransitionPage(
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                const curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(
                  CurveTween(curve: curve),
                );

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
              transitionDuration: const Duration(milliseconds: 750),
              child: const WhoPage(),
            );
          },
        ),
        GoRoute(
            path: RouteHandler.workPage,
            // parentNavigatorKey: _siteNavigatorKey,
            pageBuilder: (context, state) {
              RouteManager.currentColor = RouteHandler.workColor;
              return CustomTransitionPage(
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(-1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end).chain(
                    CurveTween(curve: curve),
                  );

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 750),
                child: const WorkPage(),
              );
            }),
        GoRoute(
          path: RouteHandler.blogPage,
          // parentNavigatorKey: _siteNavigatorKey,

          pageBuilder: (context, state) {
            RouteManager.currentColor = RouteHandler.blogColor;
            return CustomTransitionPage(
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(
                  CurveTween(curve: curve),
                );

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
              transitionDuration: const Duration(milliseconds: 750),
              child: const BlogPage(),
            );
          },
        )
      ],
    ),
  ],
  redirect: (BuildContext context, GoRouterState state) {
    final path = state.uri.path;

    switch (path) {
      case RouteHandler.homePage:
        return RouteHandler.homePage;
      case RouteHandler.whoPage:
        return RouteHandler.whoPage;
      case RouteHandler.workPage:
        return RouteHandler.workPage;
      case RouteHandler.blogPage:
        return RouteHandler.blogPage;
      default:
        return RouteHandler.homePage;
    }
  },
);
