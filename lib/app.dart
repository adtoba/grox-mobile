import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grox/core/router/app_router.dart';
import 'package:grox/core/theme/app_theme.dart';

class GroxApp extends ConsumerWidget {
  const GroxApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    return ScreenUtilInit(
      designSize: Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          onGenerateTitle: (context) => 'Grox',
          routerConfig: router,  
          theme: AppTheme.light,
          themeMode: ThemeMode.light,
        );
      }
    );
  }
}