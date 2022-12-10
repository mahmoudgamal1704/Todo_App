
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppData {

 static Map AppLang(BuildContext context) {
    return {
      'en' :AppLocalizations.of(context)!.en,
      'ar' : AppLocalizations.of(context)!.ar,

    };
  }
 static Map<ThemeMode, String> Appmodes(BuildContext context) {
   return {
     ThemeMode.light :AppLocalizations.of(context)!.light,
     ThemeMode.dark : AppLocalizations.of(context)!.dark,

   };
 }
 // static Map AppLang = {
 //    'en' :'English',
 //    'ar' : 'Arabic'
 //  };
}