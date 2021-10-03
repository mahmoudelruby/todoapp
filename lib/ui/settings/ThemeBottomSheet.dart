import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/providers/ThemeProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              if (themeProvider.isDarkModeEnabled())
                themeProvider.toggleTheme();
              Navigator.pop(context);
            },
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: getRow(AppLocalizations.of(context)!.light, !themeProvider.isDarkModeEnabled())),
          ),
          InkWell(
            onTap: () {
              if (!themeProvider.isDarkModeEnabled())
                themeProvider.toggleTheme();
              Navigator.pop(context);
            },
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: getRow(AppLocalizations.of(context)!.dark, themeProvider.isDarkModeEnabled())),
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
