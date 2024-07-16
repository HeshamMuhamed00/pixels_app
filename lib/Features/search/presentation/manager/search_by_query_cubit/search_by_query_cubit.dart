import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pixels_app/Features/home/data/model/images_model.dart';
import 'package:pixels_app/Features/home/data/repo/image_repo.dart';

part 'search_by_query_state.dart';

class SearchByQueryCubit extends Cubit<SearchByQueryState> {
  SearchByQueryCubit(this.imageRepo) : super(SearchByQueryInitial());
  final ImageRepo imageRepo;
  final List<ImageModel> _images = [];
  bool isLoading = false;

  Future<void> fetchImagesBySearch(
      {int pageNumber = 1, required String query}) async {
    if (isLoading) return;
    isLoading = true;

    if (pageNumber == 1) emit(SearchByQueryLoading());

    var result = await imageRepo.fetchImagesBySearch(
        pageNumber: pageNumber, query: query);
    result.fold((failure) {
      emit(SearchByQueryFailer(failure.errMessage));
    }, (newImages) {
      _images.addAll(newImages);
      emit(SearchByQuerySuccess(List<ImageModel>.from(_images)));
    });

    isLoading = false;
  }
}
