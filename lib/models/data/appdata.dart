
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../shared/network/local/firebase_utls.dart';

class AppData {
  static List TasksList = [];
 static Map AppLang(BuildContext context) {
    return {
      'en' :AppLocalizations.of(context)!.en,
      'ar' : AppLocalizations.of(context)!.ar,

    };
  }
  // static
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