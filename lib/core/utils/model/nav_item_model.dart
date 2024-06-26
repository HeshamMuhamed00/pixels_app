import 'package:pixels_app/core/utils/model/rive_model.dart';

class NavItemModel {
  final String title;
  final RiveModel rive;

  NavItemModel({required this.title, required this.rive});
}

List<NavItemModel> bottomNavItem = [
  NavItemModel(
    title: "Home",
    rive: RiveModel(
        src: "assets/animated-icons.riv",
        artboard: "HOME",
        stateMachineName: "HOME_interactivity"),
  ),
  NavItemModel(
    title: "Search",
    rive: RiveModel(
        src: "assets/animated-icons.riv",
        artboard: "SEARCH",
        stateMachineName: "SEARCH_Interactivity"),
  ),
  NavItemModel(
    title: "Favorites",
    rive: RiveModel(
        src: "assets/animated-icons.riv",
        artboard: "LIKE/STAR",
        stateMachineName: "STAR_Interactivity"),
  ),
];
