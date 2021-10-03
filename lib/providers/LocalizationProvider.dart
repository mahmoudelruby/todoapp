import 'package:flutter/material.dart';

class LocalaizationProvider extends ChangeNotifier {
  String local = 'en';

  void changeLocal(String newLocal) {
    if (newLocal == local) return;

    local = newLocal;
    notifyListeners();
  }
}
