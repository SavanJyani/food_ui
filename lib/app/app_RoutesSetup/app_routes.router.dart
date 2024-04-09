// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i5;
import 'package:flutter/material.dart';
import 'package:food_ui/screens/categoryScreen/category_view.dart' as _i3;
import 'package:food_ui/screens/homeScreen/homeScreen_view.dart' as _i2;
import 'package:food_ui/screens/searchItem_screen/seachItem_screen_view.dart'
    as _i4;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i6;

class Routes {
  static const homeScreenView = '/';

  static const categoryScreenView = '/category-screen-view';

  static const searchItemScreenView = '/search-item-screen-view';

  static const all = <String>{
    homeScreenView,
    categoryScreenView,
    searchItemScreenView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeScreenView,
      page: _i2.HomeScreenView,
    ),
    _i1.RouteDef(
      Routes.categoryScreenView,
      page: _i3.CategoryScreenView,
    ),
    _i1.RouteDef(
      Routes.searchItemScreenView,
      page: _i4.SearchItemScreenView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeScreenView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeScreenView(),
        settings: data,
      );
    },
    _i3.CategoryScreenView: (data) {
      final args = data.getArgs<CategoryScreenViewArguments>(nullOk: false);
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.CategoryScreenView(
            key: args.key, categoryName: args.categoryName),
        settings: data,
      );
    },
    _i4.SearchItemScreenView: (data) {
      final args = data.getArgs<SearchItemScreenViewArguments>(
        orElse: () => const SearchItemScreenViewArguments(),
      );
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.SearchItemScreenView(key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class CategoryScreenViewArguments {
  const CategoryScreenViewArguments({
    this.key,
    required this.categoryName,
  });

  final _i5.Key? key;

  final String categoryName;

  @override
  String toString() {
    return '{"key": "$key", "categoryName": "$categoryName"}';
  }

  @override
  bool operator ==(covariant CategoryScreenViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.categoryName == categoryName;
  }

  @override
  int get hashCode {
    return key.hashCode ^ categoryName.hashCode;
  }
}

class SearchItemScreenViewArguments {
  const SearchItemScreenViewArguments({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant SearchItemScreenViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

extension NavigatorStateExtension on _i6.NavigationService {
  Future<dynamic> navigateToHomeScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCategoryScreenView({
    _i5.Key? key,
    required String categoryName,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.categoryScreenView,
        arguments:
            CategoryScreenViewArguments(key: key, categoryName: categoryName),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSearchItemScreenView({
    _i5.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.searchItemScreenView,
        arguments: SearchItemScreenViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCategoryScreenView({
    _i5.Key? key,
    required String categoryName,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.categoryScreenView,
        arguments:
            CategoryScreenViewArguments(key: key, categoryName: categoryName),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSearchItemScreenView({
    _i5.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.searchItemScreenView,
        arguments: SearchItemScreenViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
