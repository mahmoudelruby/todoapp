import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/providers/LocalizationProvider.dart';
import 'package:todoapp/providers/ThemeProvider.dart';

class LocalBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localProvider = Provider.of<LocalaizationProvider>(context);
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              if (localProvider.local == 'en') localProvider.changeLocal('en');
              Navigator.pop(context);
            },
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: getRow('English', localProvider == 'en')),
          ),
          InkWell(
            onTap: () {
              if (localProvider.local == 'ar') localProvider.changeLocal('ar');
              Navigator.pop(context);
            },
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: getRow('العربيه', localProvider == "ar")),
          ),
        ],
      ),
    );
  }

  Widget? getRow(String text, bool isSelected) {
    if (isSelected) {
      return Row(
        children: [
          Text(
            text,
            style: TextStyle(color: MyThemeData.PrimaryColor),
          ),
          Icon(
            Icons.check,
            color: MyThemeData.PrimaryColor,
          )
        ],
      );
    } else {
      return Row(
        children: [
          Text(
            text,
            style: TextStyle(color: MyThemeData.PrimaryColor),
          )
        ],
      );
    }
  }
}
