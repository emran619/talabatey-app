import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talabatey/models/meal_model.dart';
import 'package:talabatey/network/local_host.dart';
import 'package:talabatey/providers/categories_provider.dart';
import 'package:talabatey/providers/order_status_provider.dart';
import 'package:talabatey/screens/add_food_item_screen.dart';
import 'package:talabatey/screens/my_order_screen.dart';
import 'package:talabatey/theme/app_colors.dart';
import 'package:talabatey/widgets/mealwidget.dart';

class HomePageScreen extends StatefulWidget {
  static const routeName = 'HomePageScreen';

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  String orderStatus = CachHelper.getData(key: 'orderstatus');
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    var order = Provider.of<Orders>(context, listen: true);
    var categoriesProvider =
        Provider.of<CategoriesProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor:
              order.orderStatus == null || order.orderStatus == 'closed'
                  ? AppColors.primary
                  : AppColors.accent,
          centerTitle: true,
          title: Text(
            order.orderStatus == null || order.orderStatus == 'closed'
                ? 'الوجبات المتاحة'
                : 'تم فتح طلب',
            style: TextStyle(
              fontFamily: 'Cairo',
              fontWeight: FontWeight.bold,
              color: AppColors.background,
            ),
          ),
          actions: [
            SizedBox(
              width: 10,
            ),
            order.orderStatus == null || order.orderStatus == 'closed'
                ? GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(AddMealScreen.routeName);
                    },
                    child: tapWidget('وجبة'),
                  )
                : Container(),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Column(
          children: [
            order.orderStatus == null || order.orderStatus == 'closed'
                ? Container()
                : Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        'حدد وجبات طلبك الحالي',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
            Expanded(
              flex: order.orderStatus == null || order.orderStatus == 'closed' ? 8 : 7,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 16,
                ),
                child: ListView.builder(
                  itemCount: categoriesProvider.categories.length,
                  itemBuilder: (BuildContext context, index) {
                    ////
                    List<Meal> meals =
                        categoriesProvider.categories[index].meals;
                    return Card(
                      color: order.orderStatus == null ||
                              order.orderStatus == 'closed'
                          ? AppColors.primary
                          : AppColors.accent,
                      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                      child: Column(
                        children: [
                          ListTile(
                            trailing: Text(
                              categoriesProvider.categories[index].name,
                              style: TextStyle(
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          if (_expanded)
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 4),
                              height: min(
                                meals.length * 20.0 + 120,
                                180,
                              ),
                              child: ListView(
                                children: meals
                                    .map((meal) => MealWidget(meal))
                                    .toList(),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: order.orderStatus == null ||
                                order.orderStatus == 'closed'
                            ? AppColors.primary
                            : AppColors.accent,
                      ),
                      child: Center(
                        child: Text(
                          order.orderStatus == null ||
                                  order.orderStatus == 'closed'
                              ? 'فتح طلب'
                              : 'حفظ الطلب',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            color: AppColors.focus,
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          order.toggoleorderStatus();
                          setState(() {
                            _expanded = !_expanded;
                          });

                          if (order.orderStatus == 'closed')
                            Navigator.pushNamed(
                              context,
                              MyOrderScreen.routeName,
                            );
                          print(categoriesProvider.categories[0].meals.length);
                        });
                      },
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column tapWidget(String title) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Icon(
            Icons.add,
            color: AppColors.background,
          ),
        ),
        Expanded(
            flex: 1,
            child: Text(
              title,
              style:
                  TextStyle(fontFamily: 'Cairo', color: AppColors.background),
            ))
      ],
    );
  }
}
