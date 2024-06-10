import 'package:dartz/dartz.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pixels_app/core/error/failure.dart';
import 'package:pixels_app/core/utils/api_service.dart';
import 'package:pixels_app/home/data/model/images_model.dart';
import 'package:pixels_app/home/data/repo/image_repo.dart';

class ImageRepoImpl implements ImageRepo {
  final ApiService apiService;

  ImageRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<ImageModels>>> downloadImages(
      {required String imageUrl,
      required int imageId,
      required BuildContext context}) {
    // TODO: implement downloadImages
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ImageModels>>> fetchImages(
      {required int? pageNumber}) async {
    try {
      var data = await apiService.get(
          endPoint: 'curated?per_page=80&page=$pageNumber');
      List<ImageModels> images = [];

      for (int i = 0; i < data.length; i++) {
        images.add(ImageModels.fromJson(data[i]));
      }
      return right(images);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ImageModels>>> fetchImagesBySearch(
      {required String query}) {
    // TODO: implement fetchImagesBySearch
    throw UnimplementedError();
  }
}
