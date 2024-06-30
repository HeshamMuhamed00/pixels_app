import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pixels_app/core/utils/constants.dart';
import 'package:pixels_app/core/utils/model/nav_item_model.dart';
import 'package:pixels_app/core/widget/selected_animated_bar.dart';
import 'package:rive/rive.dart';

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
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SelectedAnimatedBar(
                      isActive: widget.selectedIndex == index,
                    ),
                    SizedBox(
                      height: 28,
                      width: 36,
                      child: Opacity(
                        opacity: widget.selectedIndex == index ? 1 : 0.5,
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
