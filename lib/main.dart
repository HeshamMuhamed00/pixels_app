import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixels_app/Features/search/presentation/manager/search_cubit/cubit/search_cubit.dart';
import 'package:pixels_app/core/utils/service_locator.dart';
import 'package:pixels_app/Features/home/data/repo/image_repo_impl.dart';
import 'package:pixels_app/Features/home/presentation/manager/image_cubit/cubit/image_cubit.dart';
import 'package:pixels_app/Features/splash/presentation/view/splash_view.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ImageCubit(getIt.get<ImageRepoImpl>())..fetchImages(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(getIt.get<ImageRepoImpl>())
            ..fetchImagesBySearch(query: 'car'),
        ),
      ],
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
