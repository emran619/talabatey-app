import 'package:talabatey/models/category_model.dart';
import 'package:talabatey/models/meal_model.dart';

class Constant {
  static List<Category> categoriesConstant = [
    Category(
      name: 'شاورما',
      meals: [
        Meal(
          id: DateTime.now().toString(),
          name: 'شاورما لف',
          price: 3500,
          category: 'شاورما',
          quantity: 0,
        ),
        Meal(
          id: DateTime.now().toString(),
          name: 'شاورما عربي',
          price: 5000,
          category: 'شاورما',
          quantity: 0,
        )
      ],
    ),
    Category(
      name: 'وجبات غربية',
      meals: [
        Meal(
          id: DateTime.now().toString(),
          name: 'كريسبي',
          price: 5000,
          category: 'وجبات غربية',
          quantity: 0,
        ),
        Meal(
          id: DateTime.now().toString(),
          name: 'فرانشيسكو',
          price: 6000,
          category: 'وجبات غربية',
          quantity: 0,
        ),
      ],
    ),
    
    Category(
      name: 'معجنات',
      meals: [
        Meal(
          id: DateTime.now().toString(),
          name: 'محمرة',
          price: 500,
          category: 'معجنات',
          quantity: 0,
        ),
        Meal(
          id: DateTime.now().toString(),
          name: 'زعتر',
          price: 500,
          category: 'معجنات',
          quantity: 0,
        ),
      ],
    ),
    Category(
      name: 'فتات',
      meals: [
        Meal(
          id: DateTime.now().toString(),
          name: 'فول بلبن',
          price: 2500,
          category: 'فتات',
          quantity: 0,
        ),
        Meal(
          id: DateTime.now().toString(),
          name: 'مسبحة',
          price: 1500,
          category: 'فتات',
          quantity: 0,
        )
      ],
    ),
    Category(
      name: 'مشروبات',
      meals: [
        Meal(
          id: DateTime.now().toString(),
          name: 'ببسي',
          price: 2500,
          category: 'مشروبات',
          quantity: 0,
        ),
        Meal(
          id: DateTime.now().toString(),
          name: 'كوكاكولا',
          price: 2500,
          category: 'مشروبات',
          quantity: 0,
        ),
      ],
    ),
  ];
}
