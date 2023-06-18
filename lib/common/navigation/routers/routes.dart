import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/common/common.dart';
import 'package:quote_generator/features/auth/auth.dart';
import 'package:quote_generator/features/discovery/discovery.dart';
import 'package:quote_generator/features/quote/quote.dart';

final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routes = [
  GoRoute(
    path: RouteLocation.splash,
    parentNavigatorKey: navigationKey,
    builder: SplashScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.createQuote,
    parentNavigatorKey: navigationKey,
    builder: CreateQuoteScreen.builder,
  ),
  GoRoute(
    name: RouteLocation.detailScreen,
    path: '${RouteLocation.detailScreen}/:id',
    parentNavigatorKey: navigationKey,
    pageBuilder: (context, state) {
      return NoTransitionPage(
        child: QuoteCardDetails.builder(
          context,
          state,
          state.params['id'],
        ),
      );
    },
  ),
  GoRoute(
    path: RouteLocation.settings,
    parentNavigatorKey: navigationKey,
    builder: SettingsScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.auth,
    parentNavigatorKey: navigationKey,
    builder: AuthScreen.builder,
  ),

  //Bottom Nav bar shell
  ShellRoute(
    navigatorKey: _shellNavigatorKey,
    pageBuilder: (context, state, child) {
      return NoTransitionPage(
        child: BottomNavBarShell.builder(
          context,
          state,
          child,
        ),
      );
    },
    routes: [
      GoRoute(
        path: RouteLocation.createdByYou,
        parentNavigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: CreatedByYouScreen.builder(context, state),
          );
        },
      ),
      GoRoute(
        path: RouteLocation.discovery,
        parentNavigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: DiscoveryScreen.builder(context, state),
          );
        },
      ),
      GoRoute(
        path: RouteLocation.search,
        parentNavigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: SearchScreen.builder(context, state),
          );
        },
      ),
      GoRoute(
        path: RouteLocation.favorites,
        parentNavigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: FavoriteScreen.builder(context, state),
          );
        },
      ),
    ],
  ),
];
