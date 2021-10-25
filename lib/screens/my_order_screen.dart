import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talabatey/providers/categories_provider.dart';
import 'package:talabatey/providers/order_status_provider.dart';
import 'package:talabatey/theme/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:talabatey/utils/utils..dart';

class MyOrderScreen extends StatefulWidget {
  static const routeName = 'MyOrderScreen';

  @override
  _MyOrderScreenState createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  int totalPrice = 0;
  

  @override
  Widget build(BuildContext context) {
    var orderMeals = Provider.of<Orders>(context, listen: true).getMyOrderMeals;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    'لمعرفة حسابك انقر على الوجبات التي اخترتها ثم التالي للانتقال للشخص الاخر',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: orderMeals.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: orderMeals.length,
                      itemBuilder: (BuildContext context, index) {
                        return Card(
                          color: AppColors.primary,
                          margin:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: ListTile(
                              trailing: Column(
                                children: [
                                  Text(
                                    orderMeals[index].name,
                                    style: TextStyle(fontFamily: 'Cairo'),
                                  ),
                                  Text(
                                    orderMeals[index].price.toString(),
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: AppColors.background
                                            .withOpacity(0.6)),
                                  ),
                                ],
                              ),
                              leading: Text(
                                "x ${orderMeals[index].quantity.toString()}",
                                style: TextStyle(fontFamily: 'Cairo'),
                              ),
                              onTap: () {
                                setState(
                                  () {
                                    totalPrice += orderMeals[index].price;
                                    Provider.of<CategoriesProvider>(context,
                                            listen: false)
                                        .removeMealFromOrder(
                                            orderMeals[index], context);
                                  },
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Center(
                    child: Text(
                      'لايوجد طلبات حاليا',
                      style: TextStyle(
                        color: AppColors.primary.withOpacity(0.5),
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          color: AppColors.focus.withOpacity(0.3),
                          // margin: EdgeInsets.all(8),
                          child: Center(
                            child: Text(
                              totalPrice.toString(),
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  ///
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        'الإجمالي',
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.primary,
                        ),
                        onPressed: () {
                          setState(() {
                            totalPrice = 0;
                          });
                        },
                        child: Text(
                          'الشخص التالي',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                            color: AppColors.background,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.primary,
                        ),
                        onPressed: () {
                          orderMeals.isNotEmpty
                              ? Utils.showToast("يوجد وجبات بعد",ToastGravity.BOTTOM)
                              : Navigator.of(context).pop();
                        },
                        child: Text(
                          'رجوع',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                            color: AppColors.background,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
