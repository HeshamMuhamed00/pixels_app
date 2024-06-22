import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixels_app/core/utils/service_locator.dart';
import 'package:pixels_app/home/data/repo/image_repo_impl.dart';
import 'package:pixels_app/home/presentation/manager/image_cubit/cubit/image_cubit.dart';
import 'package:pixels_app/splash/presentation/view/splash_view.dart';

void main() {
  setup();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const PixelsApp(),
    ),
  );
}

class PixelsApp extends StatelessWidget {
  const PixelsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ImageCubit(getIt.get<ImageRepoImpl>())..fetchImages(),
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.black),
        home: const SplashView(),
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
