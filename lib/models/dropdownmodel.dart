import 'package:flutter/material.dart';
import 'package:talabatey/theme/app_colors.dart';

class DropDownListModel {
  String name;
  int id;
  DropDownListModel(this.id, this.name);

  static List<DropdownMenuItem<DropDownListModel>> buildDropDownMenuItem(
      List items) {
    List<DropdownMenuItem<DropDownListModel>> i = [];
    for (DropDownListModel element in items) {
      i.add(DropdownMenuItem(
        
        value: element,
        child: Center(
          child: Text(element.name,style: TextStyle(fontFamily: 'Cairo',color: AppColors.primary),),
        ),
      ));
    }
    return i;
  }

  static List<DropDownListModel> getcategory() {
    return <DropDownListModel>[
      DropDownListModel(1, "شاورما"),
      DropDownListModel(2, "وجبات غربية"),
      DropDownListModel(3, "معجنات"),
      DropDownListModel(4, "مشروبات"),
      DropDownListModel(5, "فتات"),
    ];
  }
}
