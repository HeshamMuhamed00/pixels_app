import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pixels_app/core/error/failure.dart';
import 'package:pixels_app/Features/home/data/model/images_model.dart';

abstract class ImageRepo {
  Future<Either<Failure, List<ImageModel>>> fetchImages({int pageNumber = 0});
  Future<Either<Failure, List<ImageModel>>> fetchImagesBySearch(
      {required String query, int pageNumber = 0});
  Future<Either<Failure, List<ImageModel>>> downloadImages(
      {required String imageUrl,
      required int imageId,
      required BuildContext context});
}
