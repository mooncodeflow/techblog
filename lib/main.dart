import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:techblog/components/colors.dart';
import 'package:techblog/views/categories_selection.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ProjectSolidColors.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: ProjectSolidColors.navBarColor,
      systemNavigationBarIconBrightness: Brightness.dark));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('fa', ''),
      ],
      theme: ThemeData(
          fontFamily: 'Dana',
          textTheme: const TextTheme(
            titleSmall: TextStyle(fontSize: 14),
            titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
            textStyle: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return textTheme.titleMedium!
                    .merge(const TextStyle(fontSize: 18, fontFamily: 'Dana'));
              }

              return textTheme.titleMedium!
                  .merge(const TextStyle(fontFamily: 'Dana'));
            }),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return ProjectSolidColors.accentColor;
              }

              return ProjectSolidColors.primaryColor;
            }),
          )),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                    color: ProjectSolidColors.primaryColor, width: 1)),
            contentPadding: const EdgeInsets.all(8.0),
            hintStyle: const TextStyle(color: Colors.black12),
          )),
      home: const CategoriesSelection(),
    );
  }
}
