import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/providers/mainprovider.dart';
import 'package:todoapp/shared/items/dropdownlist.dart';
import 'package:todoapp/shared/styles/colors.dart';
import 'package:todoapp/models/data/appdata.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map langmap = AppData.AppLang(context);
    List langkeys = langmap.keys.toList();
    Map<ThemeMode, String> modemap = AppData.Appmodes(context);
    List modekeys = modemap.keys.toList();
    var prov = Provider.of<MainProvider>(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 60, horizontal: 50),
      color: Theme.of(context).colorScheme.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.lang,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          DropDownList(ItemMap: langmap,val: langmap[prov.CurrentLangcode],onChang: prov.ChangeLanguage),
          Text(
            AppLocalizations.of(context)!.mode,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          DropDownList(ItemMap: modemap,val: modemap[prov.Currentmode].toString(),onChang: prov.ChangeMode),

        ],
      ),
    );
  }
}
