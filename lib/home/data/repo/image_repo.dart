import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pixels_app/core/error/failure.dart';
import 'package:pixels_app/home/data/model/images_model.dart';

abstract class ImageRepo {
  Future<Either<Failure, List<ImageModel>>> fetchImages(
      {required int? pageNumber});
  Future<Either<Failure, List<ImageModel>>> fetchImagesBySearch(
      {required String query});
  Future<Either<Failure, List<ImageModel>>> downloadImages(
      {required String imageUrl,
      required int imageId,
      required BuildContext context});
}
