import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import 'category_viewModel.dart';

class CategoryScreenView extends StatelessWidget {
  final String categoryName;

  const CategoryScreenView({Key? key, required this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoryScreenViewModel>.reactive(
      onViewModelReady: (viewModel) {
        viewModel.init(categoryName,context);
      },
      disposeViewModel: false,
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child:categoryScreenAppbar(viewModel: viewModel),
          ),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
                child: Column(
                  children: [
                    gridviewItemWidget(viewModel: viewModel),
                  ],
                ),
              ),
              favoriteAndKitoBtnWidget(viewModel: viewModel),
            ],
          ),
        );
      },
      viewModelBuilder: () => CategoryScreenViewModel(),
    );
  }

  AppBar categoryScreenAppbar({required CategoryScreenViewModel viewModel}) {
    return AppBar(
      backgroundColor: Colors.green,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: IconButton(
          icon: SvgPicture.asset("assets/icons/backArrow.svg"),
          onPressed: () {
            Navigator.of(viewModel.context).pop();
          },
        ),
      ),
      title: Text(
        categoryName,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'Montserrat'),
      ),
    );
  }

  Widget gridviewItemWidget({required CategoryScreenViewModel viewModel}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 80, top: 10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .65,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
          ),
          itemCount: viewModel.categoryList.length,
          itemBuilder: (context, index) {
            return Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xffebedef),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: Image.network(
                          viewModel.categoryList[index]['image'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 170,
                        ),
                      ),
                      Positioned(
                        top: 8.0,
                        right: 8.0,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 0,
                                blurRadius: 0.2,
                              ),
                            ],
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.favorite,
                              size: 15,
                              color: viewModel.favoriteStatus[index] ?? false ? Colors.red : const Color(0xffD9D9D9),
                            ),
                            onPressed: () {
                              viewModel.toggleFavoriteStatus(index);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
                    child: Text(
                      viewModel.categoryList[index]['name'],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff212121),
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      viewModel.categoryList[index]['item'],
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff697281),
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          viewModel.showDetailSheet(context, viewModel.categoryList[index], viewModel);
                        },
                        child: const Text(
                          "VIEW DETAILS",
                          style: TextStyle(
                            color: Color(0xff4CAF50),
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 4,
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.shopping_cart,
                                size: 15,
                                color: viewModel.shoppingCart[index] ?? false ? Colors.deepOrange : const Color(0xffD9D9D9),
                              ),
                              onPressed: () {
                                viewModel.toggleShoppingCartStatus(index);
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget favoriteAndKitoBtnWidget({required CategoryScreenViewModel viewModel}) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffFFF0E0),
        ),
        height: 70,
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "Only Favorites",
                style: TextStyle(color: Colors.orange, fontSize: 14, fontWeight: FontWeight.w600, fontFamily: 'Montserrat'),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            CupertinoSwitch(
              value: viewModel.isSelected,
              onChanged: (newValue) {
                viewModel.isSelected = newValue;
              },
              thumbColor: Colors.white,
              activeColor: Colors.orange,
            ),
            const VerticalDivider(
              color: Colors.orange,
              width: 10,
              indent: 8,
              endIndent: 8,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Only Keto",
              style: TextStyle(color: Colors.orange, fontSize: 14, fontWeight: FontWeight.w600, fontFamily: 'Montserrat'),
            ),
            const SizedBox(
              width: 30,
            ),
            CupertinoSwitch(
              value: viewModel.isSelected2,
              onChanged: (newValue) {
                viewModel.isSelected2 = newValue;
              },
              thumbColor: Colors.white,
              activeColor: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
