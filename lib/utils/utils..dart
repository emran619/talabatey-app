import 'package:fluttertoast/fluttertoast.dart';
import 'package:talabatey/theme/app_colors.dart';

class Utils {
  static void showToast(String title,ToastGravity toastGravity) {
    Fluttertoast.showToast(
      msg: title,
      toastLength: Toast.LENGTH_SHORT,
      gravity:toastGravity,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.primary,
      textColor: AppColors.background,
      fontSize: 16.0,
    );
  }
}
