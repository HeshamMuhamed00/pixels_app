import 'package:dartz/dartz.dart';
import 'package:pixels_app/core/error/failure.dart';
import 'package:pixels_app/home/data/model/images_model.dart';

abstract class ImageRepo {
  Future<Either<Failure, List<ImageModels>>> fetchImages(
      {required int? pageNumber});
  Future<Either<Failure, List<ImageModels>>> fetchImagesBySearch(
      {required String query});
}