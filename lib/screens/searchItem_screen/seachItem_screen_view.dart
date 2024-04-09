import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ui/screens/searchItem_screen/searchItem_screen_viewModel.dart';
import 'package:stacked/stacked.dart';

class SearchItemScreenView extends StatelessWidget {
  const SearchItemScreenView({Key? key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchItemScreenViewModel>.reactive(
      viewModelBuilder: () => SearchItemScreenViewModel(),
      onModelReady: (viewModel) => viewModel.initialize(context),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 50.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    userSearchItemWidget(viewModel: viewModel),
                    const SizedBox(height: 15.0),
                    const Divider(
                      height: 3,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    gridviewItemWidget(viewModel: viewModel),
                  ],
                ),
              ),
              favoriteAndKitoBtnWidget(viewModel: viewModel),
            ],
          ),
        );
      },
    );
  }

  Widget userSearchItemWidget({required SearchItemScreenViewModel viewModel}) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFEDF0F5),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextFormField(
                autofocus: true,
                focusNode: viewModel.focusNode,
                onTap: () {
                  viewModel.isSearching = true;
                  viewModel.notifyListeners();
                },
                controller: viewModel.searchController,
                decoration: InputDecoration(
                  hintText: 'What food are you looking for?',
                  hintStyle: const TextStyle(fontSize: 14, color: Color(0xff999999), fontFamily: 'Montserrat', fontWeight: FontWeight.w600),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(
                    left: 40,
                    right: 10,
                    top: 13,
                  ),
                  suffixIcon: viewModel.searchController.text.isNotEmpty
                      ? IconButton(
                          color: const Color(0xff948e8e),
                          icon: const Icon(Icons.cancel),
                          onPressed: () {
                            viewModel.clearSearch();
                          },
                        )
                      : null,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 2),
                    child: SizedBox(
                      width: 5,
                      height: 5,
                      child: SvgPicture.asset(
                        "assets/icons/Search.svg",
                        color: Color(0xff999999),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
                onChanged: viewModel.search,
              ),
            ),
          ),
        ),
        if (viewModel.isSearching)
          TextButton(
            onPressed: () {
              Navigator.of(viewModel.context).pop();
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Text(
                "Cancel",
                style: TextStyle(color: Color(0xff4CAF50), fontSize: 14, fontWeight: FontWeight.w600, fontFamily: 'Montserrat'),
              ),
            ),
          ),
      ],
    );
  }

  Widget gridviewItemWidget({required SearchItemScreenViewModel viewModel}) {
    return Visibility(
      // visible: viewModel.searchController.text.isNotEmpty,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 70),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.63,
            ),
            padding: EdgeInsets.zero,
            itemCount: viewModel.categoryItems1.length,
            itemBuilder: (context, index) {
              final item = viewModel.categoryItems1[index];

              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xffF3F5F8),
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
                            item['image'],
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 170, // Adjust the image height as needed
                          ),
                        ),
                        Positioned(
                          top: 8.0,
                          right: 8.0,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                            ),
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
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        item['name'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff212121),
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        item['item'],
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
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
                            viewModel.showDetailSheet(context, item, viewModel);
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
                                right: 10,
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.shopping_cart,
                                  size: 15,
                                  color: viewModel.shoppingCart[index] ?? false ? Colors.deepOrange : Color(0xffD9D9D9),
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
      ),
    );
  }

  Widget favoriteAndKitoBtnWidget({required SearchItemScreenViewModel viewModel}) {
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
