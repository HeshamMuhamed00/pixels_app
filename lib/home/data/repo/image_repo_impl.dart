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
  Future<Either<Failure, List<ImageModel>>> downloadImages(
      {required String imageUrl,
      required int imageId,
      required BuildContext context}) {
    // TODO: implement downloadImages
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ImageModel>>> fetchImages(
      {int pageNumber = 0}) async {
    try {
      var data = await apiService.get(
          endPoint: 'curated?per_page=80&page=$pageNumber');
      List<ImageModel> images =
          data.map((json) => ImageModel.fromJson(json)).toList();
      return right(images);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ImageModel>>> fetchImagesBySearch(
      {required String query}) {
    // TODO: implement fetchImagesBySearch
    throw UnimplementedError();
  }
}
