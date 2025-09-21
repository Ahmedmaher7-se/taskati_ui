import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati_ui/core/services/local_helper.dart';
import 'package:taskati_ui/core/utils/theme.dart';
import 'package:taskati_ui/features/splash/splash_screen.dart';



Future<void> main() async {
  await Hive.initFlutter();
  await LocalHelper.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: LocalHelper.userBox.listenable(),
      builder: (context, box, child) {
        bool? isDark = box.get(LocalHelper.kIsDark);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: isDark == null
              ? ThemeMode.system
              : isDark == true
              ? ThemeMode.dark
              : ThemeMode.light,
          darkTheme: AppTheme.darkTheme,
          theme: AppTheme.lightTheme,
          home: SplashScreen(),
        );
      },
    );
  }
}