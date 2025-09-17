import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboardx_tnb/firebase_options.dart';
import 'package:onboardx_tnb/screens/home/bottom_nav_bar.dart';
import 'package:onboardx_tnb/services/theme_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, ThemeMode currentMode, _) {
        return MaterialApp(
          title: 'OnboardX TNB',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.red,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0,
              titleTextStyle: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              iconTheme: const IconThemeData(color: Colors.black),
            ),
            iconTheme: const IconThemeData(color: Colors.black87),
            listTileTheme: const ListTileThemeData(
              iconColor: Colors.black87,
              textColor: Colors.black87,
            ),
            switchTheme: SwitchThemeData(
              thumbColor:
                  MaterialStateProperty.resolveWith((states) => Colors.white),
              trackColor:
                  MaterialStateProperty.resolveWith((states) => Colors.redAccent.withOpacity(0.4)),
            ),
            scaffoldBackgroundColor: const Color(0xFFF5F5F7),
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red).copyWith(secondary: Colors.redAccent),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.red,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme).apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
            scaffoldBackgroundColor: const Color(0xFF121212),
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              elevation: 0,
              titleTextStyle: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              iconTheme: const IconThemeData(color: Colors.white),
            ),
            iconTheme: const IconThemeData(color: Colors.white),
            listTileTheme: const ListTileThemeData(
              iconColor: Colors.white,
              textColor: Colors.white,
            ),
            // Make switches clearly visible in dark mode (white thumb, light track)
            switchTheme: SwitchThemeData(
              thumbColor:
                  MaterialStateProperty.resolveWith((states) => Colors.white),
              trackColor:
                  MaterialStateProperty.resolveWith((states) => Colors.white.withOpacity(0.4)),
            ),
            colorScheme: ColorScheme.dark(
              primary: Colors.red,
              onPrimary: Colors.white,
              secondary: Colors.redAccent,
              onSecondary: Colors.white,
            ),
          ),
          themeMode: currentMode,
          home: const BottomNavBar(),
        );
      },
    );
  }
}
