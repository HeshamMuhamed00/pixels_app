import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pixels_app/home/data/model/images_model.dart';
import 'package:pixels_app/home/data/repo/image_repo.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit(this.imageRepo) : super(ImageInitial());

  final ImageRepo imageRepo;

  final List<ImageModel> _images = [];
  bool isLoading = false;

  Future<void> fetchImages({int pageNumber = 1}) async {
    if (isLoading) return;
    isLoading = true;

    if (pageNumber == 1) emit(ImageLoading());

    var result = await imageRepo.fetchImages(pageNumber: pageNumber);
    result.fold((failure) {
      emit(ImageFailure(failure.errMessage));
    }, (newImages) {
      _images.addAll(newImages);
      emit(ImageSuccess(List<ImageModel>.from(_images)));
    });

    isLoading = false;
  }
}
