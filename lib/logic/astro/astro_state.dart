part of 'astro_bloc.dart';

abstract class AstroState extends Equatable {
  const AstroState();

  @override
  List<Object> get props => [];
}

class AstroInitial extends AstroState {}

class AstroLoadingState extends AstroState {}

class AstroLoadedState extends AstroState {
  final AstrologerModel astrologers;
  const AstroLoadedState({required this.astrologers});
  @override
  List<Object> get props => [astrologers];
}

class AstroErrorState extends AstroState {
  final String message;
  const AstroErrorState({required this.message});
  @override
  List<Object> get props => [message];
}
