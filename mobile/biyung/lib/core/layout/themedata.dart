import 'package:flutter/material.dart';

var themeData = ThemeData(
  fontFamily: 'Biryani',
  scaffoldBackgroundColor: Color(0xFFF5F2F2),
  colorScheme: _solfoxColorScheme,
  useMaterial3: false,
  textTheme: const TextTheme(
    titleMedium: TextStyle(color: warnaBlack),
    // displayMedium: TextStyle(color: sfOnSecond),
    // bodySmall: TextStyle(color: warnaBlack),
    // bodyMedium: TextStyle(color: warnaOnSecond),
    // headlineLarge: TextStyle(color: warnaOnPrim),
    // titleLarge: TextStyle(color: warnaOnPrim),
  ),
  appBarTheme: AppBarTheme(foregroundColor: Colors.white),
  inputDecorationTheme: InputDecorationTheme(
    focusColor: warnaTri,
    labelStyle: TextStyle(color: warnaBlack, fontSize: 16),
    contentPadding: EdgeInsets.all(8),
    isDense: true,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.all(16),
      backgroundColor: Colors.orange,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
  ),
);

const ColorScheme _solfoxColorScheme = ColorScheme(
  primary: warnaPrimary,
  secondary: warnaSecondary,
  tertiary: warnaTri,
  surface: warnaSurface,
  primaryContainer: warnaPrimary,
  error: warnaSecondary,
  onPrimary: warnaOnPrim,
  onSecondary: warnaOnSecond,
  onSurface: warnaOnSurface,
  onError: warnaSecondary,
  brightness: Brightness.light,
  onErrorContainer: warnaSecondary,
  onPrimaryContainer: warnaOnPrim,
);

// const Color warnaPrimary = Color(0xFF003285);
// const Color warnaPrimary = Color(0xFF487FF1);
const Color warnarTri = Color(0xFFFFC700);
// const Color warnaSecondary = Color(0xFFFF7F3E);
const Color warnaSecondary = Colors.orange;
// const Color warnaTri = Color(0xFF44B300);
const Color warnaPrimary = Color(0xFF6FCF35);
const Color warnaTri = Color(0xFF6FCF35);
const Color warnaSurface = Color(0XFF4D4B4C);

// const Color warnaBlack = Color(0xFF2C365A);
const Color warnaBlack = Colors.black;
// const Color warnaOnPrim = Color.fromARGB(255, 143, 40, 40);
const Color warnaOnPrim = Colors.white;
const Color warnaOnSurface = Color.fromARGB(255, 33, 49, 97);
const Color warnaOnSecond = Color.fromARGB(255, 28, 196, 50);
const Color warnaBackground = Color(0xFF487FF1);
const Color warnaKartu = Color(0xFFE8EAEB);

const gradientCard = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  stops: [0, 1],
  colors: [Color(0xFF0F40A4), Color(0xFF487FF1)],
);
const gradientButton = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  stops: [0, 1],
  colors: [Color(0xFFE1C773), Color(0xFFD4AF37)],
);

const bgGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  stops: [0, 0.5, 1],
  colors: [
    Color(0xFF0F40A4),
    Color(0xFF487FF1),
    Color(0xFF49A2C9),
    // Color(0xFF49A2C9),
  ],
);

const circleGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  stops: [0, 1],
  colors: [
    Color.fromARGB(255, 199, 218, 255),
    Color.fromARGB(255, 255, 255, 255),
    // Color(0xFF49A2C9),
  ],
);
