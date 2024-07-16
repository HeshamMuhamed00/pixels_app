part of 'search_by_query_cubit.dart';

@immutable
sealed class SearchByQueryState {}

final class SearchByQueryInitial extends SearchByQueryState {}

final class SearchByQuerySuccess extends SearchByQueryState {
  final List<ImageModel> images;

  SearchByQuerySuccess(this.images);
}

final class SearchByQueryLoading extends SearchByQueryState {}

final class SearchByQueryFailer extends SearchByQueryState {
  final String errMessage;

  SearchByQueryFailer(this.errMessage);
}
