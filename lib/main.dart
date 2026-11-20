import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/screens/main_layout.dart';
import 'constants/colors.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Management App',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.primaryColor,
        canvasColor: AppColors.primaryColor,
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: AppColors.secondaryColor.withValues(alpha: 0.4),
          cursorColor: AppColors.secondaryColor,
          selectionHandleColor: AppColors.secondaryColor,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          }
        ),
        actionIconTheme: ActionIconThemeData(
          backButtonIconBuilder: (context) =>
          const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        appBarTheme: const AppBarThemeData(
          scrolledUnderElevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
      ),
      home: const MainLayout(),
    );
  }
}
