import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';

class SearchItemScreenViewModel extends BaseViewModel {
  late BuildContext context;
  // ToggleSwich1
  bool _isSelected = false;
  int selectedView = 0;

  bool get isSelected => _isSelected;

  FocusNode focusNode = FocusNode();

  set isSelected(bool value) {
    _isSelected = value;
    notifyListeners(); // Notify listeners of the change
  }

  // ToggleSwich2
  bool _isSelected2 = false;
  int selectedView2 = 0;

  bool get isSelected2 => _isSelected2;

  set isSelected2(bool value) {
    _isSelected2 = value;
    notifyListeners(); // Notify listeners of the change
  }

  void setIndex(int index) {
    selectedBottomIndex = index;
    notifyListeners();
  }

  // favoriteButton
  Map<int, bool> favoriteStatus = {};

  void toggleFavoriteStatus(int index) {
    favoriteStatus[index] = !(favoriteStatus[index] ?? false);
    notifyListeners();
  }

  // ShoppingCart
  Map<int, bool> shoppingCart = {};

  bool isSearching = false;

  void toggleShoppingCartStatus(int index) {
    shoppingCart[index] = !(shoppingCart[index] ?? false);
    notifyListeners();
  }

  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> categoryItems = [
    // vegetables
    {
      'image': 'https://t4.ftcdn.net/jpg/05/37/04/61/360_F_537046123_s8JVn2NrClPQDOryhSm8jonYZPfIzPRX.jpg',
      'name': 'Tamoto',
      'item': "Cruciferous Vegetable",
    },
    {
      'image': 'https://seed2plant.in/cdn/shop/products/carrotseeds.jpg?v=1604032858&width=1500',
      'name': 'Carrot',
      'item': "Cruciferous Vegetable",
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLcWeEWCLmqRJaeFUyZtoJJz378E3ZxR2kzrMFoMK07XWB_EjsMVxfXxjJdr1JS3-LalE&usqp=CAU',
      'name': 'Flower',
      'item': "Cruciferous Vegetable",
    },
    {
      'image':
          'https://www.jiomart.com/images/product/original/590003515/onion-1-kg-product-images-o590003515-p590003515-0-202203170724.jpg?im=Resize=(1000,1000)',
      'name': 'onion',
      'item': "Cruciferous Vegetable",
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaeSTtccBi9CtOb1PagJrFqcsD5VCbtCCWmgyVwX3xMA&s',
      'name': 'Brinjal',
      'item': "Cruciferous Vegetable",
    },
    {
      'image': 'https://urjaseeds.com/cdn/shop/products/Okra_900x.jpg?v=1592061110',
      'name': 'Bindi',
      'item': "Cruciferous Vegetable",
    },

    // Leafy Green

    {
      'image':
          'https://media.istockphoto.com/id/481492527/photo/leafy-green-vegetables-isolated.jpg?s=612x612&w=0&k=20&c=aZXg1q24VVX8zhciACz50YwNE63D_SPVZ_-5o3OJ5oQ=',
      'name': 'Leaty Green',
      'item': "Cruciferous Vegetable",
    },
    {
      'image':
          'https://media.istockphoto.com/id/897528572/photo/healthy-fresh-green-vegetables-heap-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=irVjLF7adLKbxBLxFjDl68kqzNCd0lLEio4tQ_mPTpg=',
      'name': 'Leaty Green ',
      'item': "Cruciferous Vegetable",
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnjUPybDJuk8Du2-njnIDQPBxst21s4TOLdp-zCceGn0No1K5c5tZ3VZaVO7yVVfp88pE&usqp=CAU',
      'name': 'Green ',
      'item': "Cruciferous Vegetable",
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLVyiPd28MhrIZltm0hMf5XjYOM68A6GNmScNJ7ggfgg&s',
      'name': 'Palak',
      'item': "Cruciferous Vegetable",
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlNwv1uTunbyV1pkiJLB5oynv7cJ7JaxGQJ6adhnCFMg&s',
      'name': 'LeatyGreen',
      'item': "Cruciferous Vegetable",
    },
    {
      'image':
          'https://www.shape.com/thmb/0JFiz0-3cl8IOfvj3DRsCrj0Pl8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/leafy-greens-fb-2000-031d02b3754b4cf0bdaf8a68a40b5d3a.jpg',
      'name': 'Palak Green',
      'item': "Cruciferous Vegetable",
    },

    // Dairy Product

    {
      'image': 'https://thumbs.dreamstime.com/b/photo-milk-products-17497436.jpg',
      'name': 'Milk',
      'item': " Dairy",
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKAYeyBa_oigmk-2rm-m1jHWa3nrmX_tg2mQ&s',
      'name': 'Butter',
      'item': " Dairy",
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTHogmOeVaWwDMGMoojMuSdL-vJr3sbYevZd_XX9yrpA&s',
      'name': 'Cheese',
      'item': " Dairy",
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSy3rAZWZ64-ovCOdq7gCHaumTonNNzwTto4skXPs0v-Q&s',
      'name': 'ButterMilk',
      'item': " Dairy",
    },
    {
      'image': 'https://grannyproducts.com/wp-content/uploads/2020/08/Ghee.png',
      'name': 'Ghee',
      'item': " Dairy",
    },
    {
      'image':
          'https://media.istockphoto.com/id/1241482623/photo/assorted-of-dairy-product-with-milk-butter-cheese.webp?b=1&s=170667a&w=0&k=20&c=KGrWjxUGelufyTgW6nYX3IIYuXZ7All2vDwDqqcCc7c=',
      'name': 'yogurt ',
      'item': " Dairy",
    },

    //plantbasedProteins

    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLQes5Iy-G9Ksw64c6VhGzZLaObaH_TMfswRXPANiSXw&s',
      'name': 'High Protin food',
      'item': "Cruciferous Protin",
    },
    {
      'image':
          'https://www.thespruceeats.com/thmb/SUgdFlRf4JSqBxlu30YuRPDUztU=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/what-is-plant-protein-and-how-is-it-used-5114486-hero-01-5cdb50b0205c4da1a9b75efa5f2ed198.jpg',
      'name': 'Protin',
      'item': "Cruciferous Protin",
    },

    {
      'image': 'https://plantbasednews.org/app/uploads/2021/07/plant-based-news-vegan-food-highest-protein.jpg',
      'name': 'Green Vegans',
      'item': "Cruciferous Protin",
    },
    {
      'image': 'https://img.onmanorama.com/content/dam/mm/en/food/features/images/2022/7/9/plant-based-protein-vegan.jpg',
      'name': 'Protin 85%',
      'item': "Cruciferous Protin",
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-EAFj2aAELUelU_JNSNLcTcjWdHtTgOF8UZcwOhXBmSKYyPlJrSQn9FfoeqPTxiEL-qA&usqp=CAU',
      'name': 'Sources plant',
      'item': "Cruciferous Protin",
    },

    {
      'image': 'https://gardenerspath.com/wp-content/uploads/2020/06/Plant-Based-Protein-Sources-as-Part-of-a-Healthy-Diet-2.jpg',
      'name': 'Garderner plant',
      'item': "Cruciferous Protin",
    },

    // Fruits

    {
      'image': 'https://media.istockphoto.com/id/184276818/photo/red-apple.jpg?s=612x612&w=0&k=20&c=NvO-bLsG0DJ_7Ii8SSVoKLurzjmV0Qi4eGfn6nW3l5w=',
      'name': 'Apple',
      'item': "Fruit",
    },
    {
      'image': 'https://media.istockphoto.com/id/185284489/photo/orange.jpg?s=612x612&w=0&k=20&c=m4EXknC74i2aYWCbjxbzZ6EtRaJkdSJNtekh4m1PspE=',
      'name': 'Orange',
      'item': "Fruit",
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThtrMcBRbbd84CWi2VGV90_kygrWUkMC_XGJ7NNmvbaQ&s',
      'name': 'Pineapple',
      'item': "Protin",
    },
    {
      'image': 'https://t4.ftcdn.net/jpg/00/68/65/13/360_F_68651370_CVcQlAdJqvxtL8bIUm70UP1HwnFXOblQ.jpg',
      'name': 'Kiwi',
      'item': "Fruit",
    },
    {
      'image': 'https://img3.exportersindia.com/product_images/bc-full/2021/10/9149098/fresh-banana-1633953556-6033371.jpeg',
      'name': 'Banana',
      'item': "Fruit",
    },
    {
      'image': 'https://t3.ftcdn.net/jpg/00/71/10/72/360_F_71107237_3GNipwDTQnsDZN3cMvXr3o9SPdxt4sXx.jpg',
      'name': 'Graps',
      'item': "Fruit",
    },

    //herbs

    {
      'image': 'https://www.allthatgrows.in/cdn/shop/articles/Feat-Image_1100x1100.jpg?v=1594124414',
      'name': 'Mint',
      'item': "Natural",
    },
    {
      'image':
          'https://www.diggers.com.au/cdn/shop/products/culinary-herb-collection-s911_3fb7e013-6c7b-4155-a708-4eb378b893be_1200x.jpg?v=1637122462',
      'name': 'Culinary',
      'item': "Natural",
    },
    {
      'image': 'https://floweraura-blog-img.s3.ap-south-1.amazonaws.com/plants-blogs/blog-289/ajwain-plant.jpg',
      'name': 'Herbal plant',
      'item': "Natural",
    },
    {
      'image': 'https://www.carehospitals.com/indore/assets/images/blogs/health-importance-of-indian-herbs.jpg',
      'name': 'Brsil',
      'item': "Natural",
    },
    {
      'image': 'https://static.toiimg.com/thumb/85864562.cms?width=400&height=300&resizemode=4&imgsize=179002',
      'name': 'Fresh Herbal',
      'item': "Natural",
    },
    {
      'image': 'https://assets.epicurious.com/photos/57b34461df05218810c52123/16:9/w_1280,c_limit/54-Herbs_Dark.jpg',
      'name': 'Herbs',
      'item': "Natural",
    },
  ];
  List<Map<String, dynamic>> categoryItems1 = [];
  void initialize(BuildContext context) {
    this.context = context;
    FocusScopeNode().requestFocus(focusNode);
    isSearching = true;
    categoryItems1.addAll(categoryItems);
    notifyListeners();
  }

  void clearSearch() {
    searchController.clear();
    search('');
    notifyListeners();
  }

  void search(String query) {
    categoryItems1.clear();
    if (query.isEmpty) {
      categoryItems1.addAll(categoryItems);
    } else {
      categoryItems1.addAll(
        categoryItems.where(
          (element) => element['name'].toString().toLowerCase().contains(query.trim().toLowerCase()),
        ),
      );
    }
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> vegetableItemsList = [
    {
      'image': 'https://t4.ftcdn.net/jpg/05/37/04/61/360_F_537046123_s8JVn2NrClPQDOryhSm8jonYZPfIzPRX.jpg',
      'name': 'Tomoto',
      'item': "Cruciferous Vegetable",
    },
    {
      'image': 'https://seed2plant.in/cdn/shop/products/carrotseeds.jpg?v=1604032858&width=1500',
      'name': 'Carrot',
      'item': "Cruciferous Vegetable",
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLcWeEWCLmqRJaeFUyZtoJJz378E3ZxR2kzrMFoMK07XWB_EjsMVxfXxjJdr1JS3-LalE&usqp=CAU',
      'name': 'Flower',
      'item': "Cruciferous Vegetable",
    },
    {
      'image':
          'https://www.jiomart.com/images/product/original/590003515/onion-1-kg-product-images-o590003515-p590003515-0-202203170724.jpg?im=Resize=(1000,1000)',
      'name': 'onion',
      'item': "Cruciferous Vegetable",
    },
    {
      'image': 'https://www.shutterstock.com/image-photo/three-fresh-eggplants-isolated-on-600nw-1381722392.jpg',
      'name': 'Brinjal',
      'item': "Cruciferous Vegetable",
    },
    {
      'image': 'https://urjaseeds.com/cdn/shop/products/Okra_900x.jpg?v=1592061110',
      'name': 'Bindi',
      'item': "Cruciferous Vegetable",
    },
  ];
  List<Map<String, dynamic>> leafyGreensList = [
    {
      'image':
          'https://media.istockphoto.com/id/481492527/photo/leafy-green-vegetables-isolated.jpg?s=612x612&w=0&k=20&c=aZXg1q24VVX8zhciACz50YwNE63D_SPVZ_-5o3OJ5oQ=',
      'name': 'Leaty Green',
      'item': "Cruciferous Vegetable",
    },
    {
      'image':
          'https://media.istockphoto.com/id/897528572/photo/healthy-fresh-green-vegetables-heap-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=irVjLF7adLKbxBLxFjDl68kqzNCd0lLEio4tQ_mPTpg=',
      'name': 'Leaty Green ',
      'item': "Cruciferous Vegetable",
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnjUPybDJuk8Du2-njnIDQPBxst21s4TOLdp-zCceGn0No1K5c5tZ3VZaVO7yVVfp88pE&usqp=CAU',
      'name': 'Green ',
      'item': "Cruciferous Vegetable",
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLVyiPd28MhrIZltm0hMf5XjYOM68A6GNmScNJ7ggfgg&s',
      'name': 'Palak',
      'item': "Cruciferous Vegetable",
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlNwv1uTunbyV1pkiJLB5oynv7cJ7JaxGQJ6adhnCFMg&s',
      'name': 'Leaty Green',
      'item': "Cruciferous Vegetable",
    },
    {
      'image':
          'https://www.shape.com/thmb/0JFiz0-3cl8IOfvj3DRsCrj0Pl8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/leafy-greens-fb-2000-031d02b3754b4cf0bdaf8a68a40b5d3a.jpg',
      'name': 'Palak Green',
      'item': "Cruciferous Vegetable",
    },
  ];
  List<Map<String, dynamic>> dairyProductList = [
    {
      'image': 'https://thumbs.dreamstime.com/b/photo-milk-products-17497436.jpg',
      'name': 'Milk',
      'item': " Dairy",
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKAYeyBa_oigmk-2rm-m1jHWa3nrmX_tg2mQ&s',
      'name': 'Butter',
      'item': " Dairy",
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTHogmOeVaWwDMGMoojMuSdL-vJr3sbYevZd_XX9yrpA&s',
      'name': 'Cheese',
      'item': " Dairy",
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSy3rAZWZ64-ovCOdq7gCHaumTonNNzwTto4skXPs0v-Q&s',
      'name': 'ButterMilk',
      'item': " Dairy",
    },
    {
      'image': 'https://grannyproducts.com/wp-content/uploads/2020/08/Ghee.png',
      'name': 'Ghee',
      'item': " Dairy",
    },
    {
      'image':
          'https://media.istockphoto.com/id/1241482623/photo/assorted-of-dairy-product-with-milk-butter-cheese.webp?b=1&s=170667a&w=0&k=20&c=KGrWjxUGelufyTgW6nYX3IIYuXZ7All2vDwDqqcCc7c=',
      'name': 'yogurt ',
      'item': " Dairy",
    },
  ];
  List<Map<String, dynamic>> plantBasedProteinsList = [
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLQes5Iy-G9Ksw64c6VhGzZLaObaH_TMfswRXPANiSXw&s',
      'name': 'High Protin food',
      'item': "Cruciferous Protin",
    },
    {
      'image':
          'https://www.thespruceeats.com/thmb/SUgdFlRf4JSqBxlu30YuRPDUztU=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/what-is-plant-protein-and-how-is-it-used-5114486-hero-01-5cdb50b0205c4da1a9b75efa5f2ed198.jpg',
      'name': 'Protin',
      'item': "Cruciferous Protin",
    },
    {
      'image': 'https://plantbasednews.org/app/uploads/2021/07/plant-based-news-vegan-food-highest-protein.jpg',
      'name': 'Green Vegans',
      'item': "Cruciferous Protin",
    },
    {
      'image': 'https://img.onmanorama.com/content/dam/mm/en/food/features/images/2022/7/9/plant-based-protein-vegan.jpg',
      'name': 'Protin 85%',
      'item': "Cruciferous Protin",
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-EAFj2aAELUelU_JNSNLcTcjWdHtTgOF8UZcwOhXBmSKYyPlJrSQn9FfoeqPTxiEL-qA&usqp=CAU',
      'name': 'Sources plant',
      'item': "Cruciferous Protin",
    },
    {
      'image': 'https://gardenerspath.com/wp-content/uploads/2020/06/Plant-Based-Protein-Sources-as-Part-of-a-Healthy-Diet-2.jpg',
      'name': 'Garderner plant',
      'item': "Cruciferous Protin",
    },
  ];
  List<Map<String, dynamic>> fruitList = [
    {
      'image': 'https://media.istockphoto.com/id/184276818/photo/red-apple.jpg?s=612x612&w=0&k=20&c=NvO-bLsG0DJ_7Ii8SSVoKLurzjmV0Qi4eGfn6nW3l5w=',
      'name': 'Apple',
      'item': "Fruit",
    },
    {
      'image': 'https://media.istockphoto.com/id/185284489/photo/orange.jpg?s=612x612&w=0&k=20&c=m4EXknC74i2aYWCbjxbzZ6EtRaJkdSJNtekh4m1PspE=',
      'name': 'Orange',
      'item': "Fruit",
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThtrMcBRbbd84CWi2VGV90_kygrWUkMC_XGJ7NNmvbaQ&s',
      'name': 'Pineapple',
      'item': "Fruit",
    },
    {
      'image': 'https://t4.ftcdn.net/jpg/00/68/65/13/360_F_68651370_CVcQlAdJqvxtL8bIUm70UP1HwnFXOblQ.jpg',
      'name': 'Kiwi',
      'item': "Fruit",
    },
    {
      'image': 'https://img3.exportersindia.com/product_images/bc-full/2021/10/9149098/fresh-banana-1633953556-6033371.jpeg',
      'name': 'Banana',
      'item': "Fruit",
    },
    {
      'image': 'https://t3.ftcdn.net/jpg/00/71/10/72/360_F_71107237_3GNipwDTQnsDZN3cMvXr3o9SPdxt4sXx.jpg',
      'name': 'Graps',
      'item': "Fruit",
    },
  ];
  List<Map<String, dynamic>> herbalList = [
    {
      'image': 'https://www.allthatgrows.in/cdn/shop/articles/Feat-Image_1100x1100.jpg?v=1594124414',
      'name': 'Mint',
      'item': "Natural",
    },
    {
      'image':
          'https://www.diggers.com.au/cdn/shop/products/culinary-herb-collection-s911_3fb7e013-6c7b-4155-a708-4eb378b893be_1200x.jpg?v=1637122462',
      'name': 'Culinary',
      'item': "Natural",
    },
    {
      'image': 'https://floweraura-blog-img.s3.ap-south-1.amazonaws.com/plants-blogs/blog-289/ajwain-plant.jpg',
      'name': 'Herbal plant',
      'item': "Natural",
    },
    {
      'image': 'https://www.carehospitals.com/indore/assets/images/blogs/health-importance-of-indian-herbs.jpg',
      'name': 'Brsil',
      'item': "Natural",
    },
    {
      'image': 'https://static.toiimg.com/thumb/85864562.cms?width=400&height=300&resizemode=4&imgsize=179002',
      'name': 'Fresh Herbal',
      'item': "Natural",
    },
    {
      'image': 'https://assets.epicurious.com/photos/57b34461df05218810c52123/16:9/w_1280,c_limit/54-Herbs_Dark.jpg',
      'name': 'Herbs',
      'item': "Natural",
    },
  ];

  List<Map<String, dynamic>> categoryList = [];
  init(String categoryName) {
    if (categoryName == "Vegetable") {
      categoryList = vegetableItemsList;
    } else if (categoryName == "Leafy Greens") {
      categoryList = leafyGreensList;
    } else if (categoryName == "Dairy Products") {
      categoryList = dairyProductList;
    } else if (categoryName == "Plant Based Protein") {
      categoryList = plantBasedProteinsList;
    } else if (categoryName == "Fruit") {
      categoryList = fruitList;
    } else if (categoryName == "Herbs") {
      categoryList = herbalList;
    }

    notifyListeners();
  }

  bool isFavorite = false;
  String selectedBrand = "Apple";
  String selectedSize = "Small";
  int selectedBottomIndex = 0;

  showDetailSheet(context, Map<String, dynamic> data, SearchItemScreenViewModel viewModel) {
    double getScreenHeight = MediaQuery.of(context).size.height;
    double getScreenWidth = MediaQuery.of(context).size.width;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true, enableDrag: false,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      // constraints: BoxConstraints(maxHeight: getScreenHeight * .99),
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: ClipOval(
                          child: Container(
                            height: 30,
                            width: 30,
                            color: Colors.grey.shade300,
                            child: const Icon(
                              Icons.close,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Center(
                          child: Text(
                            "Food Detail",
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16, fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                      ClipOval(
                        child: GestureDetector(
                          onTap: () {
                            isFavorite = !isFavorite;
                            setState(() {});
                          },
                          child: Container(
                            height: 36,
                            width: 36,
                            color: const Color(0xfff1f3f6),
                            child: Icon(
                              isFavorite ? Icons.favorite : Icons.favorite_border,
                              size: 18,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                height: 8,
                color: Colors.grey,
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: SizedBox(
                          width: getScreenWidth,
                          height: getScreenHeight * .25,
                          child: Image.network(
                            data['image'],
                            width: getScreenWidth,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Gap(15),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['name'],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                    fontSize: 16,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                                Text(
                                  data['item'],
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(right: 10, top: 7, left: 15),
                              child: Text(
                                "Keto food",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const Gap(10),
                      const Text(
                        "Lomdi AI Chatbot is not affiliated with any celebrities. It is \nnot professional in any field. the replies provided is general information purpose only.Lomdi AI Chatbot is not affiliated with any celebrities. It is not professional in any field. the replies provided is general information purpose only.",
                        style:
                            TextStyle(color: Color(0xff616161), fontWeight: FontWeight.w600, fontSize: 11.5, fontFamily: 'Montserrat', height: 1.5),
                        textAlign: TextAlign.start,
                      ),
                      const Gap(8),
                      const Divider(
                        color: Colors.grey,
                        endIndent: 10,
                      ),
                      const Gap(8),
                      const Text(
                        "Select Brand",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 11.5,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      const Gap(8),
                      Row(
                        children: [
                          getButton(
                            title: "Apple",
                            isSelected: selectedBrand == "Apple",
                            onPressed: (p0) {
                              selectedBrand = "Apple";
                              setState(() {});
                            },
                          ),
                          const Gap(12),
                          getButton(
                            title: "Meta",
                            isSelected: selectedBrand == "Meta",
                            onPressed: (p0) {
                              selectedBrand = "Meta";
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      const Gap(20),
                      const Text(
                        "Select Size",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 11.5,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      const Gap(8),
                      Row(
                        children: [
                          getButton(
                            title: "Small",
                            isSelected: selectedSize == "Small",
                            onPressed: (p0) {
                              selectedSize = "Small";
                              setState(() {});
                            },
                          ),
                          const Gap(12),
                          getButton(
                            title: "Medium",
                            isSelected: selectedSize == "Medium",
                            onPressed: (p0) {
                              selectedSize = "Medium";
                              setState(() {});
                            },
                          ),
                          const Gap(12),
                          getButton(
                            title: "Large",
                            isSelected: selectedSize == "Large",
                            onPressed: (p0) {
                              selectedSize = "Large";
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      const Gap(50),
                      Container(
                        width: getScreenWidth,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            "Buy Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ),
                      const Gap(10),
                      Container(
                        width: getScreenWidth,
                        height: 50,
                        decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(8)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Add to shopping list",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.shopping_cart_outlined,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
      },
    );
  }

  getButton({
    required String title,
    bool isSelected = false,
    Function(bool)? onPressed,
  }) {
    return GestureDetector(
      onTap: () {
        onPressed?.call(!isSelected);
      },
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff4CAF50).withOpacity(0.1) : const Color(0xffD5D5D5).withOpacity(0.2),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 1,
            color: isSelected ? const Color(0xff4CAF50) : Colors.grey.withOpacity(0.5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
          child: Text(
            title,
            style: TextStyle(
                color: isSelected ? const Color(0xff4CAF50) : const Color(0xff616161),
                fontWeight: FontWeight.w500,
                fontSize: 12.5,
                fontFamily: 'Montserrat'),
          ),
        ),
      ),
    );
  }
}
