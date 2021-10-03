import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/LocalizationProvider.dart';
import 'package:todoapp/providers/ThemeProvider.dart';
import 'package:todoapp/ui/DataBase/MyDataBase.dart';
import 'package:todoapp/ui/addtodo/AddToDoBottomSheet.dart';
import 'package:todoapp/ui/homescreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';




void main() {
initDataBase();
  runApp(MyApp());
}

//الدقيقه 23

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return ChangeNotifierProvider(
      create:(context)=>LocalaizationProvider(),
      builder: (context,widget){
       return ChangeNotifierProvider(
          create: (context)=>ThemeProvider(),
          builder:( context, widget ) {

            final themeProvider = Provider.of<ThemeProvider>(context) ;
            final localProvider = Provider.of<LocalaizationProvider>(context);

            return MaterialApp(
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.supportedLocales  ,
              locale: Locale( localProvider.local),

              themeMode: themeProvider.themeMode,
              theme: MyThemeData.lightTheme,
              darkTheme: MyThemeData.darkTheme,
              routes: {
                HomeScreen.ROUTE_NAME :(context)=>HomeScreen (),
              },
              initialRoute: HomeScreen.ROUTE_NAME,
            );
          },
        );
      },
    );
  }
}
class MyThemeData{
  static final lightTheme=ThemeData(
      primaryColor: MyThemeData.PrimaryColor,
      accentColor: MyThemeData.BackgroundColor,
      scaffoldBackgroundColor: MyThemeData.BackgroundColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: MyThemeData.PrimaryColor)) ;

  static final darkTheme= ThemeData(
      primaryColor: MyThemeData.PrimaryColor,
      accentColor: MyThemeData.BackgroundColor,
      scaffoldBackgroundColor: MyThemeData.BlackColor,

      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: MyThemeData.PrimaryColor)) ;

          static final PrimaryColor = Color.fromARGB(255, 93, 156, 236);
  static final WhiteColor =Color.fromARGB( 255, 255, 255, 255);
  static final BlackColor =Color.fromARGB(255, 54, 54, 54);
  static final BackgroundColor =Color.fromARGB(255, 223, 236, 219);
}