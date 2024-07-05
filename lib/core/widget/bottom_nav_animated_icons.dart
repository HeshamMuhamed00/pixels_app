import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pixels_app/core/utils/constants.dart';
import 'package:pixels_app/core/utils/model/nav_item_model.dart';
import 'package:pixels_app/core/widget/selected_animated_bar.dart';
import 'package:rive/rive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavAnimatedIcons extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNavAnimatedIcons({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  State<BottomNavAnimatedIcons> createState() => _BottomNavAnimatedIconsState();
}

class _BottomNavAnimatedIconsState extends State<BottomNavAnimatedIcons> {
  List<SMIBool> riveIconInput = [];
  List<StateMachineController?> controllers = [];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadSelectedIndex();
  }

  void _loadSelectedIndex() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedIndex = prefs.getInt('selectedIndex') ?? 0;
    });
  }

  void _saveSelectedIndex(int index) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('selectedIndex', index);
  }

  void animateTheIcon(int index) {
    riveIconInput[index].change(true);
    Future.delayed(const Duration(seconds: 1), () {
      riveIconInput[index].change(false);
    });
  }

  void riveOnInit(Artboard artboard, {required String stateMachineName}) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, stateMachineName);
    artboard.addController(controller!);
    controllers.add(controller);

    riveIconInput.add(controller.findInput<bool>('active') as SMIBool);
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 90),
        decoration: BoxDecoration(
            color: bottomNavColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                  color: bottomNavColor.withOpacity(0.3),
                  offset: const Offset(0, 20),
                  blurRadius: 20),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            bottomNavItem.length,
            (index) {
              final riveIcon = bottomNavItem[index].rive;
              return GestureDetector(
                onTap: () {
                  animateTheIcon(index);
                  widget.onItemTapped(index);
                  _saveSelectedIndex(index);
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SelectedAnimatedBar(
                      isActive: _selectedIndex == index,
                    ),
                    SizedBox(
                      height: 28,
                      width: 36,
                      child: Opacity(
                        opacity: _selectedIndex == index ? 1 : 0.5,
                        child: RiveAnimation.asset(
                          riveIcon.src,
                          artboard: riveIcon.artboard,
                          onInit: (artboard) {
                            riveOnInit(artboard,
                                stateMachineName: riveIcon.stateMachineName);
                          },
                        ),
                      ),
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
}
