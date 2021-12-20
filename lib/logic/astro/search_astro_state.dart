part of 'search_astro_cubit.dart';

abstract class SearchAstroState extends Equatable {
  const SearchAstroState();

  @override
  List<Object> get props => [];
}

class SearchAstroInitial extends SearchAstroState {}

class SearchAstroLoading extends SearchAstroState {}

class SearchAstroSuccess extends SearchAstroState {
  final List<AstrologerModelData> astroesFiltered;
  const SearchAstroSuccess({required this.astroesFiltered});
}

class SearchAstroFailure extends SearchAstroState {
  final String error;
  const SearchAstroFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'SearchAstroFailure { error: $error }';
}
