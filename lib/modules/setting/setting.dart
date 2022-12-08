import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/providers/mainprovider.dart';
import 'package:todoapp/shared/styles/colors.dart';
import 'package:todoapp/models/data/appdata.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map langmap = AppData.AppLang(context);
    List langkeys = langmap.keys.toList();
    var prov = Provider.of<MainProvider>(context);
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 60, horizontal: 50),
      color: BackGcolor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.lang,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          DropdownButton(
            items: langkeys.map<DropdownMenuItem<String>>((value) {
              return DropdownMenuItem<String>(
                value: langmap[value],
                child: Text(langmap[value]),
              );
            }).toList(),
            onChanged: (v) {
              var key = langmap.keys.firstWhere(
                (element) => langmap[element] == v,
                orElse: () => null,
              );
              prov.ChangeLanguage( key.toString());
              },
            value: langmap[prov.CurrentLangcode],
          ),
        ],
      ),
    );
  }
}
