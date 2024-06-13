import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:video_player/video_player.dart';
import 'package:pixels_app/home/presentation/view/home_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  SplashViewBodyState createState() => SplashViewBodyState();
}

class SplashViewBodyState extends State<SplashViewBody> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(
      'assets/pixels_spalsh.mp4',
    )
      ..initialize().then((_) {
        setState(() {});
      })
      ..setVolume(0.0);

    _playVideo();
  }

  void _playVideo() async {
    _controller.play();
    await Future.delayed(const Duration(seconds: 6));
    if (mounted) {
      Navigator.push(
        context,
        navigateToHome(),
      );
    }
  }

  PageTransition<dynamic> navigateToHome() {
    return PageTransition(
      duration: const Duration(milliseconds: 300),
      type: PageTransitionType.bottomToTopJoined,
      childCurrent:
          this.build(context), // Using the current widget's build method
      child: const HomeView(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container(),
      ),
    );
  }
}
