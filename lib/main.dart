import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/%20layout/home_layout.dart';
import 'package:todoapp/models/providers/mainprovider.dart';
import 'package:todoapp/shared/styles/mytheme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp( ChangeNotifierProvider(create: (BuildContext context)=> MainProvider()..getTaskfromFirestore(DateTime.now()),
  child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var myprov = Provider.of<MainProvider>(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales:  [
        Locale('en'), // English, no country code
        Locale('ar'), // Spanish, no country code
      ],
      locale: Locale(myprov.CurrentLangcode),
      initialRoute: HomeLayout.RouteName,
      routes: {
        HomeLayout.RouteName:(context) => HomeLayout(),

      },
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme ,
      darkTheme: MyTheme.darktheme,
      themeMode: myprov.Currentmode ,

    );
  }
}

