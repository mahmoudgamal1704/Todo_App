import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/providers/mainprovider.dart';
import 'package:todoapp/shared/styles/colors.dart';
import 'package:todoapp/models/data/appdata.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Settings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MainProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30,horizontal: 15),
      color: BackGcolor,
      child: Column(
        children: [
          Text(AppLocalizations.of(context)!.lang,style: Theme.of(context).textTheme.bodyText1,),

        ],
      ),
    );
  }
}
