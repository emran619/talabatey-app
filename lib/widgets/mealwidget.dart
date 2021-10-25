import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talabatey/models/meal_model.dart';
import 'package:talabatey/providers/categories_provider.dart';
import 'package:talabatey/theme/app_colors.dart';
import 'package:talabatey/widgets/dissmisiblebackgroundwidget.dart';

class MealWidget extends StatefulWidget {
  final Meal meal;
  MealWidget(this.meal);
  @override
  _MealWidgetState createState() => _MealWidgetState();
}

class _MealWidgetState extends State<MealWidget> {
  void _showEditngDialog() {
    final _pricecontroller = TextEditingController();
    final GlobalKey<FormState> _formkey = GlobalKey();
    void onSaved() {
      if (!_formkey.currentState.validate()) {
        return;
      }
      _formkey.currentState.save();
      Navigator.of(context).pop();
    }

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: AppColors.accent,
          contentPadding: EdgeInsets.all(8),
          title: Form(
            key: _formkey,
            child: Column(
              children: [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextFormField(
                    controller: _pricecontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'السعر',
                      labelStyle: TextStyle(
                        color: AppColors.background,
                        fontFamily: 'Cairo',
                      ),
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: AppColors.background,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: AppColors.background,
                          width: 2.0,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'أدخل السعر';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      Provider.of<CategoriesProvider>(context, listen: false)
                          .editMealFromSingleCategory(
                        widget.meal,
                        int.tryParse(_pricecontroller.text),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          children: [
            SimpleDialogOption(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: AppColors.primary),
                child: const Text(
                  'تعديل',
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      color: AppColors.background,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                onPressed: () {
                  setState(() {
                    onSaved();
                  });
                },
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'رجوع',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    color: AppColors.background,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
          elevation: 10,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: DissmisibleBackgroundWidget(),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) async {
        if (direction == DismissDirection.endToStart) {
          Provider.of<CategoriesProvider>(context, listen: false)
              .removeMealFromSingleCategory(widget.meal);
        }
        return null;
      },
      child: Card(
        color: AppColors.primary,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            trailing: Column(
              children: [
                Text(
                  widget.meal.name,
                  style: TextStyle(fontFamily: 'Cairo'),
                ),
                Text(
                  widget.meal.price.toString(),
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      color: AppColors.background.withOpacity(0.6)),
                ),
              ],
            ),
            leading: Text(
              "x ${widget.meal.quantity.toString()}",
              style: TextStyle(fontFamily: 'Cairo'),
            ),
            onTap: () {
              setState(() {
                Provider.of<CategoriesProvider>(context, listen: false)
                    .addMealToOrder(widget.meal, context);
              });
            },
            onLongPress: () {
              _showEditngDialog();
            },
          ),
        ),
      ),
    );
  }
}
