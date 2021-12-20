part of 'filter_astro_cubit.dart';

abstract class FilterAstroState extends Equatable {
  const FilterAstroState();

  @override
  List<Object> get props => [];
}

class FilterAstroInitial extends FilterAstroState {}

class FilterAstroLoading extends FilterAstroState {}

class FilterAstroSuccess extends FilterAstroState {
  final List<AstrologerModelData> astroesFiltered;
  const FilterAstroSuccess(this.astroesFiltered);
  @override
  List<Object> get props => [astroesFiltered];
  @override
  String toString() => 'FilterAstroSuccess { astroesFiltered: $astroesFiltered }';
}

class FilterAstroFailure extends FilterAstroState {
  final String error;
  const FilterAstroFailure({required this.error});
  @override
  List<Object> get props => [error];
  @override
  String toString() => 'FilterAstroFailure { error: $error }';
}
