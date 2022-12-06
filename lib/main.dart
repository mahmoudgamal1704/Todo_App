import 'package:flutter/material.dart';
import 'package:todoapp/%20layout/home_layout.dart';
import 'package:todoapp/shared/styles/mytheme.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeLayout.RouteName,
      routes: {
        HomeLayout.RouteName:(context) => HomeLayout(),

      },
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme ,
      darkTheme: MyTheme.darktheme,
      themeMode: ThemeMode.light ,

    );
  }
}

