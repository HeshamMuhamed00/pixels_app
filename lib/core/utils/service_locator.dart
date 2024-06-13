import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pixels_app/core/utils/api_service.dart';
import 'package:pixels_app/home/data/repo/image_repo_impl.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<ImageRepoImpl>(ImageRepoImpl(ApiService(Dio())));

  getIt.get<ApiService>();
}
