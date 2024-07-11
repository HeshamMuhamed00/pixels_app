part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<ImageModel> images;

  SearchSuccess(this.images);
}

final class SearchLoading extends SearchState {}

final class SearchFailer extends SearchState {
  final String errMessage;

  SearchFailer(this.errMessage);
}
