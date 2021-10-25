import 'package:flutter/cupertino.dart';
import 'package:talabatey/models/meal_model.dart';
import 'package:talabatey/network/local_host.dart';

class Orders with ChangeNotifier {
  String orderStatus;
  List<Meal> orderMeals = [];

  void setClosed() {
    orderStatus = 'closed';
    CachHelper.saveData(key: 'orderstatus', value: 'closed');
    notifyListeners();
  }

  void setOpend() {
    orderStatus = 'opend';
    CachHelper.saveData(key: 'orderstatus', value: 'opend');
    notifyListeners();
  }

  void toggoleorderStatus() {
    orderStatus == null || orderStatus == 'closed' ? setOpend() : setClosed();
    notifyListeners();
  }

  void addNewMealToOrder(Meal meal) {
    orderMeals.add(meal);
    notifyListeners();
  }

  void removeMealFromOrder(Meal meal) {
    orderMeals.remove(meal);
    notifyListeners();
  }

  List<Meal> get getMyOrderMeals => orderMeals.toSet().toList();
}
