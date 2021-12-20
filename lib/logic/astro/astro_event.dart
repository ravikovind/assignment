part of 'astro_bloc.dart';

abstract class AstroEvent extends Equatable {
  const AstroEvent();

  @override
  List<Object> get props => [];
}

class FetchAllAstro extends AstroEvent {
  @override
  List<Object> get props => [];
}

class SortAstro extends AstroEvent {
  final AstrologerModel astrologers;
  final bool priceHighToLow;
  final bool priceLowToHigh;
  final bool experienceHighToLow;
  final bool experienceLowToHigh;

  const SortAstro(
      {required this.astrologers,
      this.priceHighToLow = false,
      this.priceLowToHigh = false,
      this.experienceHighToLow = false,
      this.experienceLowToHigh = false});

  @override
  List<Object> get props => [
        astrologers,
        priceHighToLow,
        priceLowToHigh,
        experienceHighToLow,
        experienceLowToHigh
      ];
}

