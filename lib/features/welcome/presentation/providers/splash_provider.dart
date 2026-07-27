import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:go_router/go_router.dart';
import 'package:grox/core/router/app_routes.dart';

class SplashProvider extends ChangeNotifier {
  Future<void> init(BuildContext context) async {
    Timer(const Duration(seconds: 4), () {
      context.pushReplacement(AppRoutes.onboarding);
    });
  }
}

final splashProvider = ChangeNotifierProvider<SplashProvider>((ref) {
  return SplashProvider();
});