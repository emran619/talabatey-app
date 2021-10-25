import 'package:flutter/material.dart';
import 'package:talabatey/screens/home_page_screen.dart';
import 'package:talabatey/theme/app_colors.dart';
import '../network/local_host.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedIn;

  @override
  void initState() {
    isLoggedIn = CachHelper.getData(key: 'isLoggedIn');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.of(context).pushReplacementNamed(HomePageScreen.routeName);
    });
    return SafeArea(
      child: Scaffold(
            backgroundColor: AppColors.accent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'طلباتي',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      color: AppColors.background,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ),
                Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.background,
                        ),
                  ),
                )
              ],
            ),
          ),
    );
  }
}
