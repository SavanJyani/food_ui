import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../screens/categoryScreen/category_view.dart';
import '../../screens/homeScreen/homeScreen_view.dart';
import '../../screens/searchItem_screen/seachItem_screen_view.dart';

@StackedApp(routes: [
  MaterialRoute(page: HomeScreenView, initial: true),
  MaterialRoute(page: CategoryScreenView),
  MaterialRoute(page: SearchItemScreenView),
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: BottomSheetService),
])
class AppSetup {}
