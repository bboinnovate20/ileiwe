import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
    static final theme =  ThemeData(
        useMaterial3: true,
        bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
        appBarTheme: const AppBarTheme(color: Colors.transparent,),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7A00AA),
          primary: const Color(0xFFFF5CFA),
          secondary: const Color(0xFF4A0F6E),
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          tertiary: const Color(0xFFA020F0),
          surface: const Color(0xFF7A00AA)
        ),
      
      
    );

    ThemeData customFontTheme(TextTheme textTheme) {
        return theme.copyWith(
          textTheme: textTheme.copyWith(
            titleLarge: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
            titleSmall: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              color: Colors.black
            ),
            
            // bodyMedium: GoogleFonts.gabarito(
            //   fontSize: 16,
            //   color: Colors.black
            // ),
            // headlineMedium: GoogleFonts.lora(
            //   textStyle: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w600),
            // ),
            //  headlineSmall: GoogleFonts.lora(
            //   textStyle: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w600),
            // ),
            // titleLarge: GoogleFonts.lora(
            //   textStyle: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w600),
            // ),
            // titleMedium: GoogleFonts.lora(
            //   textStyle: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w600),
            // ),
            // titleSmall: GoogleFonts.lora(
            //   textStyle: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w600),
            // ),
            // bodyLarge:GoogleFonts.gabarito(
            //   textStyle: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 26),
            // ),
            
            
            displaySmall:GoogleFonts.lilitaOne(
              textStyle: theme.textTheme.headlineMedium?.copyWith(),
            ),
           displayMedium:GoogleFonts.lilitaOne(
              textStyle: theme.textTheme.headlineMedium?.copyWith(),
            ),
            
          )
        );
    }
}

class DarkAppTheme extends AppTheme{
  static final theme =  ThemeData(
        // bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
        useMaterial3: true,
        bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF781CAD),
          primary: Colors.red,
          secondary: const Color(0xFF4A0F6E),
          onPrimary: Colors.red,
          onSecondary: Colors.red,
          onSurface: Colors.red,   
        ),
    );
}
fontTheme() {
  // return AppTheme.theme;
  final theme = AppTheme();
  // return theme.theme;
  return theme.customFontTheme(GoogleFonts.poppinsTextTheme(AppTheme.theme.textTheme));
}


// ThemeData fontThemeDark() {
//   final theme = DarkAppTheme();
//   return theme.customFontTheme(GoogleFonts.gabaritoTextTheme(AppTheme.theme.textTheme));
// }

