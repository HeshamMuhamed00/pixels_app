import 'package:dartz/dartz.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pixels_app/core/error/failure.dart';
import 'package:pixels_app/home/data/model/images_model.dart';
import 'package:pixels_app/home/data/repo/image_repo.dart';

class ImageRepoImpl implements ImageRepo {
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
      {required int? pageNumber}) {
    // TODO: implement fetchImages
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ImageModels>>> fetchImagesBySearch(
      {required String query}) {
    // TODO: implement fetchImagesBySearch
    throw UnimplementedError();
  }
}
