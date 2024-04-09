import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../categoryScreen/category_view.dart';
import '../searchItem_screen/seachItem_screen_view.dart';
import 'homeScreen_viewModel.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
      disposeViewModel: false,
      onViewModelReady: (viewModel) => viewModel.init(context),
      builder: (
        context,
        viewModel,
        child,
      ) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: homeScreenAppbar(viewModel: viewModel),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(
                  children: [
                    userSearchItemWidget(viewModel: viewModel),
                    const SizedBox(
                      height: 20,
                    ),
                    categoryWidget(viewModel: viewModel),
                  ],
                ),
              ),
              offerBannerWidget(viewModel: viewModel),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color(0xff4CAF50),
            selectedItemColor: Colors.white,
            unselectedItemColor: const Color(0xffB7DFB9),
            selectedLabelStyle: const TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: const TextStyle(
              color: Color(0xffB7DFB9),
            ),
            currentIndex: viewModel.selectedBottomIndex,
            onTap: viewModel.setIndex,
            iconSize: 24,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: SvgPicture.asset(
                    'assets/icons/home.svg',
                    color: viewModel.selectedBottomIndex == 0 ? Colors.white : Color(0xffB7DFB9),
                    width: 24,
                    height: 24,
                  ),
                ),
                label: 'Home',

              ),
              const BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: Icon(Icons.favorite_border),
                ),
                label: 'Favorite',
              ),
              const BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: Icon(Icons.shopping_cart_outlined),
                ),
                label: 'Shopping List',
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => HomeScreenViewModel(),
    );
  }

  AppBar homeScreenAppbar({required HomeScreenViewModel viewModel}) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Padding(
        padding: EdgeInsets.only(left: 10.0, top: 20),
        child: Text(
          "Lectin Light",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Color(0xff4CAF50), fontFamily: 'Montserrat'),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0, top: 20),
          child: PopupMenuButton(
            onSelected: (value) {
              showDialog(
                context: viewModel.context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: CircleAvatar(
                            backgroundColor: Color(0xffE2420F),
                            radius: 30,
                            child: SvgPicture.asset(
                              "assets/icons/Delete.svg",
                              height: 40,
                              width: 40,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Delete Account',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'Montserrat'),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "   Your account and all associated \nactivity will be permanently deleted. \n  Are you sure you want to proceed?",
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xff616161), fontFamily: 'Montserrat'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 220,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xffE2420F),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Ok',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffF3F5F6),
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 220,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff616161),
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            icon: SvgPicture.asset(
              "assets/icons/menu.svg",
              height: 30,
              width: 30,
            ),
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry>[
                const PopupMenuItem(
                  value: 0,
                  child: Row(
                    children: [
                      Icon(
                        Icons.sports_basketball_outlined,
                        size: 30,
                        color: Colors.black87,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Our Website',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xff212121), fontFamily: 'Montserrat'),
                      ),
                    ],
                  ),
                ),
                PopupMenuDivider(),
                const PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: [
                      Icon(
                        Icons.mail_outline,
                        size: 30,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Contact Us',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xff212121), fontFamily: 'Montserrat'),
                      ),
                    ],
                  ),
                ),
                PopupMenuDivider(),
                PopupMenuItem(
                  value: 2,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/LogOut.svg",
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Log Out',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xff212121), fontFamily: 'Montserrat'),
                      ),
                    ],
                  ),
                ),
                PopupMenuDivider(),
                const PopupMenuItem(
                  value: 3,
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete_outline_outlined,
                        size: 30,
                        color: Color(0xffEA2828),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Delete Account',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xffEA2828), fontFamily: 'Montserrat'),
                      ),
                    ],
                  ),
                ),
              ];
            },
          ),
        ),
      ],
    );
  }

  Widget userSearchItemWidget({required HomeScreenViewModel viewModel}) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffedf0f5),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Focus(
                focusNode: viewModel.focusNode,
                child: TextFormField(

                  controller: viewModel.searchController,
                  onTap: () {
                    viewModel.focusNode.requestFocus();
                    String searchText = 'Default text';
                    if (searchText.isNotEmpty) {
                      Navigator.push(
                        viewModel.context,
                        MaterialPageRoute(
                          builder: (context) => SearchItemScreenView(),
                        ),
                      );
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'What food are you looking for?',
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Color(0xff999999),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(
                      left: 40,
                      right: 10,
                      top: 13,
                    ), // Adjust padding values
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 2),
                      child: SizedBox(
                        width: 5,
                        height: 5,
                        child: SvgPicture.asset(
                          "assets/icons/Search.svg",
                          height: 16,
                          width: 16,
                          color: const Color(0xff999999),
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
        ),
      ],
    );
  }

  Widget categoryWidget({required HomeScreenViewModel viewModel}) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.only(left: 5, bottom: 100),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .8,
          mainAxisSpacing: 15,
          crossAxisSpacing: 10,
        ),
        itemCount: viewModel.categoryItems1.length,
        itemBuilder: (context, index) {
          return categoryItemsWidget(viewModel: viewModel, index, context);
        },
      ),
    );
  }

  Widget offerBannerWidget({required HomeScreenViewModel viewModel}) {
    return Positioned(
      bottom: 10,
      left: 15,
      right: 15,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.orange,
        ),
        height: 70,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: [
              const Text(
                "Get up to 50% off all \nGundry, MD supplements",
                style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600, fontFamily: 'Montserrat'),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                child: const Text(
                  "Shop Now",
                  style: TextStyle(fontFamily: 'Montserrat', fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryItemsWidget(int index, BuildContext context, {required HomeScreenViewModel viewModel}) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreenView(
              categoryName: viewModel.categoryItems1[index]['name'],
            ),
          ),
        ).then((value) => viewModel.clearSearch());
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4), // Shadow color
                      offset: Offset(0, 6.21),
                      blurRadius: 5.01,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    viewModel.categoryItems1[index]['image'],
                    fit: BoxFit.cover,
                    width: 165,
                    height: 160,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              viewModel.categoryItems1[index]['name'],
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xff212121), fontFamily: 'Montserrat'),
            ),
          ),
          const SizedBox(height: 3),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              viewModel.categoryItems1[index]['item'],
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Color(0xff697281), fontFamily: 'Montserrat'),
            ),
          ),
        ],
      ),
    );
  }
}
