import 'package:flutter/material.dart';
import 'package:talabatey/theme/app_colors.dart';

class FloatingActionButtonWidget extends StatefulWidget {
  const FloatingActionButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  _FloatingActionButtonWidgetState createState() =>
      _FloatingActionButtonWidgetState();
}

class _FloatingActionButtonWidgetState
    extends State<FloatingActionButtonWidget> {

  @override
  Widget build(BuildContext context) {

    return FloatingActionButton(
      backgroundColor:AppColors.primary,
      onPressed: (){},
      child: Center(
        child: Icon(
          Icons.add,
          color:AppColors.background,
        ),
      ),
    );
  }
}
