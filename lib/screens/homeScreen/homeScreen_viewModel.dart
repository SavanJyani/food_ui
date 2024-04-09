import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class HomeScreenViewModel extends BaseViewModel {
  TextEditingController searchController = TextEditingController();
  FocusNode focusNode = FocusNode();
  late BuildContext context;
  List<Map<String, dynamic>> categoryItems = [
    {
      'image':
          'https://media.istockphoto.com/id/1203599923/photo/food-background-with-assortment-of-fresh-organic-vegetables.jpg?s=612x612&w=0&k=20&c=DZy1JMfUBkllwiq1Fm_LXtxA4DMDnExuF40jD8u9Z0Q=',
      'name': 'Vegetable',
      'item': "6 items",
    },
    {
      'image': 'https://www.asknestle.in/sites/default/files/2022-10/Green-Leafy-Vegetables-640x380.jpg',
      'name': 'Leafy Greens',
      'item': "6 items",
    },
    {
      'image': 'https://www.shutterstock.com/image-photo/various-dairy-products-600nw-627224804.jpg',
      'name': 'Dairy Products',
      'item': "6 items",
    },
    {
      'image': 'https://plantbasednews.org/app/uploads/2021/07/plant-based-news-vegan-food-highest-protein.jpg',
      'name': 'Plant Based Protein',
      'item': "6 items",
    },
    {
      'image': 'https://img.freepik.com/free-photo/vibrant-collection-healthy-fruit-vegetables-generated-by-ai_24640-80425.jpg',
      'name': 'Fruit',
      'item': "6 items",
    },
    {
      'image':
          'https://www.thespruceeats.com/thmb/GFvSucJcAVCi2WNtsmLh8I3Sbkw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/various-fresh-herbs-907728974-cc6c2be53aac46de9e6a4b47a0e630e4.jpg',
      'name': 'Herbs',
      'item': "6 items",
    },
  ];
  List<Map<String, dynamic>> categoryItems1 = [];

  bool _isFocused = false;
  bool get isFocused => _isFocused;

  void setFocus(bool focus) {
    _isFocused = focus;
    notifyListeners();
  }

  void init(BuildContext context) {
    this.context = context;
    FocusScopeNode().requestFocus(focusNode);
    categoryItems1.addAll(
      categoryItems,
    );
  }

  clearSearch() {
    searchController.clear();
    search("");
    FocusManager.instance.primaryFocus?.unfocus();
    setFocus(false);
  }

  void search(String query) {
    categoryItems1.clear();

    if (query.isEmpty) {
      categoryItems1.addAll(categoryItems);
    } else {
      categoryItems1.addAll(
        categoryItems
            .where(
              (element) => element["name"].toString().toLowerCase().contains(
                    query.toString().toLowerCase(),
                  ),
            )
            .toList(),
      );
    }
    notifyListeners();
  }

  // bottomNavigationBar
  int selectedBottomIndex = 0;
  void setIndex(int index) {
    selectedBottomIndex = index;
    notifyListeners();
  }
}
