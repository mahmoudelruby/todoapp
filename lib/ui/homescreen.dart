import 'package:flutter/material.dart';
import 'package:todoapp/ui/addtodo/AddToDoBottomSheet.dart';
import 'package:todoapp/ui/list/ListFragment.dart';
import 'package:todoapp/ui/settings/SettingsFragment.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeScreen extends StatefulWidget {
  static final ROUTE_NAME = 'home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int SelectetdIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openToDo();
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.appTitle,
        ),
        toolbarHeight: 150,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          currentIndex: SelectetdIndex,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          onTap: (int position) {
            setState(() {
              SelectetdIndex = position;
            });
          },
          items: [
            BottomNavigationBarItem(
                label:  AppLocalizations.of(context)!.home,
                icon: ImageIcon(AssetImage('assets/images/ic_list.png'))),
            BottomNavigationBarItem(
                label:  AppLocalizations.of(context)!.settings,
                icon: ImageIcon(AssetImage('assets/images/ic_settings.png')))
          ],
        ),
      ),
      body: getSelectedWidget(),
    );
  }
void openToDo(){
    showModalBottomSheet(context: context, builder: (builder){
      return AddToDoBottomSheet();
    },
   isScrollControlled: true
    );
}
  Widget? getSelectedWidget() {
    if (SelectetdIndex == 0) return TodoListFragment();
    return SettingsFragment();
  }
}
