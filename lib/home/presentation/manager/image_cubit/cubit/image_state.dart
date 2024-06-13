part of 'image_cubit.dart';

@immutable
sealed class ImageState {}

final class ImageInitial extends ImageState {}

final class ImageLoading extends ImageState {}

final class ImageSuccess extends ImageState {
  final List<ImageModels> images;

  ImageSuccess(this.images);
}

final class ImageFailure extends ImageState {
  final String errMessage;

  ImageFailure(this.errMessage);
}
