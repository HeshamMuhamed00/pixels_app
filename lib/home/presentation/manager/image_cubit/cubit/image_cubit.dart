import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pixels_app/home/data/model/images_model.dart';
import 'package:pixels_app/home/data/repo/image_repo.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit(this.imageRepo) : super(ImageInitial());

  final ImageRepo imageRepo;
  int pageNumber = 1;
  Future<void> fetchImages() async {
    emit(ImageLoading());

    var result = await imageRepo.fetchImages(pageNumber: pageNumber);
    result.fold((failure) {
      emit(ImageFailure(failure.errMessage));
    }, (images) {
      emit(ImageSuccess(images));
    });
  }
}
