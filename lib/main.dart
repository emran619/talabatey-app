import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talabatey/network/local_host.dart';
import 'package:talabatey/providers/categories_provider.dart';
import 'package:talabatey/providers/order_status_provider.dart';
import 'package:talabatey/screens/add_food_item_screen.dart';
import 'package:talabatey/screens/home_page_screen.dart';
import 'package:talabatey/screens/my_order_screen.dart';
import 'package:talabatey/screens/splash_screen.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await CachHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        Provider<Orders>(create: (_) => Orders()),
        Provider<CategoriesProvider>(create: (_) => CategoriesProvider()), 
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'تطبيق طلباتي',
        theme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: AppBarTheme(
            backwardsCompatibility: false,
          ),
        ),
        home: SplashScreen(),
        routes: {
          'HomePageScreen': (BuildContext context) => HomePageScreen(),
          'AddMealScreen': (BuildContext context) => AddMealScreen(),
          'MyOrderScreen': (BuildContext context) => MyOrderScreen(),
          
        },
      ),
    );
  }
}
