import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/providers/mainprovider.dart';

 class DropDownList extends StatelessWidget {
  // const DropDownList({Key? key}) : super(key: key);
  Map ItemMap ;
  String val ;
 Function onChang ;
  DropDownList({ required this.ItemMap,required this.val,required this.onChang});
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: ItemMap.keys.toList().map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem<String>(
          value: ItemMap[value],
          child: Text(ItemMap[value]!),
        );
      }).toList(),
      onChanged: (value) {
        onChang(ItemMap, value.toString());
      },
      value:val,
    );
  }

}
