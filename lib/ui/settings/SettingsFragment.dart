
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/providers/LocalizationProvider.dart';
import 'package:todoapp/providers/ThemeProvider.dart';
import 'package:todoapp/ui/settings/LocalBottomSheet.dart';
import 'package:todoapp/ui/settings/ThemeBottomSheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsFragment extends StatefulWidget {
  @override
  _SettingsFragmentState createState() => _SettingsFragmentState();
}

class _SettingsFragmentState extends State<SettingsFragment> {

  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);
    final localProvider = Provider.of<LocalaizationProvider>(context);

    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.theme
            ,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: MyThemeData.WhiteColor),
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
              margin: EdgeInsets.only(top: 8, bottom: 8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: MyThemeData.PrimaryColor, width: 1),
                  color: MyThemeData.WhiteColor),
              child: Row(
                children: [
                  themeProvider.isDarkModeEnabled()?
                  Text(AppLocalizations.of(context)!.light):
                  Text(AppLocalizations.of(context)!.dark),

                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
          Text(
            AppLocalizations.of(context)!.language,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: MyThemeData.WhiteColor),
          ),
          InkWell(
            onTap: (){
              ShowLocalBottomSheet();
                      },
            child: Container(
              margin: EdgeInsets.only(top: 8, bottom: 8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: MyThemeData.PrimaryColor, width: 1),
                  color: MyThemeData.WhiteColor),
              child: Row(
                children: [
                  localProvider.local=='en'?
                  Text("English"):
                  Text("العربيه")
                  ,Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return ThemeBottomSheet();
        });
  }
  void ShowLocalBottomSheet(){
    showModalBottomSheet(
        context: context ,
        builder: (buildContext) {
          return LocalBottomSheet();
        });
  }
}
