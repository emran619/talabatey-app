import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:talabatey/models/dropdownmodel.dart';
import 'package:talabatey/models/meal_model.dart';
import 'package:talabatey/providers/categories_provider.dart';
import 'package:talabatey/theme/app_colors.dart';
import 'package:talabatey/utils/utils..dart';

class AddMealScreen extends StatefulWidget {
  static const routeName = 'AddMealScreen';

  @override
  _AddMealScreenState createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _pricecontroller = TextEditingController();
  List<DropDownListModel> _cat = DropDownListModel.getcategory();
  List<DropdownMenuItem<DropDownListModel>> _catdropDownMenueItems;
  DropDownListModel _selectedcat;
  Meal addedMeal = Meal(
    id: DateTime.now().toString(),
    name: ' ',
    price: 0,
    category: ' ',
    quantity: 0,
  );

  @override
  void initState() {
    _catdropDownMenueItems = DropDownListModel.buildDropDownMenuItem(_cat);
    _selectedcat = _catdropDownMenueItems[0].value;
  }

  @override
  Widget build(BuildContext context) {
    void onSaved() {
      if (!_formkey.currentState.validate()) {
        return;
      }
      _formkey.currentState.save();
      Provider.of<CategoriesProvider>(context, listen: false)
          .addMealToSingleCategory(addedMeal);
      Utils.showToast("تمت الإضافة بنجاح", ToastGravity.TOP);
      Navigator.of(context).pop();
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          centerTitle: true,
          title: Text(
            'إضافة الى القائمة الرئيسية',
            style: TextStyle(
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
                color: AppColors.background),
          ),
        ),
        body: Form(
          key: _formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextFormField(
                    controller: _namecontroller,
                    keyboardType: TextInputType.name,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cairo',
                    ),
                    decoration: InputDecoration(
                      labelText: 'اسم الوجبة',
                      labelStyle: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cairo',
                      ),
                      fillColor: AppColors.primary,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: AppColors.primary,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: AppColors.primary,
                          width: 2.0,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'أدخل اسم الوجبة';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      addedMeal.name = _namecontroller.text;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextFormField(
                    controller: _pricecontroller,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cairo',
                    ),
                    decoration: InputDecoration(
                      labelText: 'السعر',
                      labelStyle: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cairo',
                      ),
                      fillColor: AppColors.primary,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: AppColors.primary,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: AppColors.primary,
                          width: 2.0,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'أدخل سعر الوجبة';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      addedMeal.price = int.tryParse(_pricecontroller.text);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.primary,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton(
                        dropdownColor: AppColors.background,
                        underline: Divider(
                          thickness: 2,
                          color: AppColors.primary,
                        ),
                        isExpanded: true,
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          color: AppColors.primary,
                        ),
                        value: _selectedcat,
                        items: _catdropDownMenueItems,
                        onChanged: (val) {
                          setState(
                            () {
                              _selectedcat = val;
                              addedMeal.category = _selectedcat.name;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              ////
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.primary,
                    ),
                    child: Center(
                      child: Text(
                        'إضافة',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          color: AppColors.focus,
                        ),
                      ),
                    ),
                    onPressed: () {
                      onSaved();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
