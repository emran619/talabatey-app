import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:talabatey/constant/mealslist_constant.dart';
import 'package:talabatey/models/category_model.dart';
import 'package:talabatey/models/meal_model.dart';
import 'package:talabatey/providers/order_status_provider.dart';

class CategoriesProvider with ChangeNotifier {
  List<Category> categories = Constant.categoriesConstant;

  void addNewCategory(Category cat) {
    int match = 0;
    for (int i = 0; i <= categories.length; i++) {
      if (cat.name == categories[i].name) {
        match++;
      }
    }
    if (match == 0) {
      categories.add(cat);
      print('New Category is : $cat');
      notifyListeners();
    }
  }

  void addMealToSingleCategory(Meal meal) {
    categories.forEach((categ) {
      if (categ.name == meal.category) {
        categ.meals.add(meal);
        notifyListeners();
        return;
      }
    });
  }

  void removeMealFromSingleCategory(Meal meal) {
    categories.forEach((categ) {
      if (categ.name == meal.category) {
        categ.meals.removeWhere((item) => item.id == meal.id);
        notifyListeners();
        return;
      }
    });
  }

  void editMealFromSingleCategory(Meal meal, int newprice) {
    categories.forEach((categ) {
      if (categ.name == meal.category) {
        final title = categ.meals.firstWhere((item) => item.id == meal.id);
        title.price = newprice;
        notifyListeners();
        return;
      }
    });
  }

  void addMealToOrder(Meal meal, BuildContext context) {
    categories.forEach((categ) {
      if (categ.name == meal.category) {
        final addedMeal = categ.meals.firstWhere((item) => item.id == meal.id);
        addedMeal.quantity++;
        Provider.of<Orders>(context,listen: false).addNewMealToOrder(addedMeal);
        notifyListeners();
        return;
      }
    });
  }

  void removeMealFromOrder(Meal meal, BuildContext context) {
    categories.forEach((categ) {
      if (categ.name == meal.category) {
        final myMeal = categ.meals.firstWhere((item) => item.id == meal.id);
        myMeal.quantity--;
        Provider.of<Orders>(context,listen: false).removeMealFromOrder(myMeal);
        notifyListeners();
        return;
      }
    });
  }

  void clearQuantities() {
    categories.forEach(
      (categ) {
        for (int i = 0; i <= categories.length; i++) {
          categories[i].meals.forEach(
            (meal) {
              meal.quantity = 0;
              notifyListeners();
            },
          );
        }
      },
    );
  }
}
