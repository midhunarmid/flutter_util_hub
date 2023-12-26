import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_util_hub/core/presentation/pages/dummy_screen.dart';
import 'package:flutter_util_hub/core/presentation/pages/signin_screen.dart';
import 'package:flutter_util_hub/core/presentation/utils/widget_helper.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  errorBuilder: (context, state) => const DummyScreen(text: "Error Screen"),
  redirect: (BuildContext context, GoRouterState state) {
    if (!["/home", "/signin", "/forgotPassword", "/signup"]
        .contains(state.fullPath)) {
      // if any routes which needs auth, check for auth
      bool auth = Random().nextBool();
      if (!auth) {
        // if not authenticated, show signin screen
        return '/signin';
      } else {
        // if authenticated, proceed
        return null;
      }
    } else {
      // for any screens which not need auth, proceed
      return null;
    }
  },
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SigninScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'signin',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const SigninScreen(),
          ),
        ),
        GoRoute(
          path: 'forgotPassword',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const DummyScreen(text: "Forgot Password Screen"),
          ),
        ),
        GoRoute(
          path: 'home',
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const DummyScreen(text: "Home Screen"),
          ),
        ),
      ],
    ),
  ],
);
