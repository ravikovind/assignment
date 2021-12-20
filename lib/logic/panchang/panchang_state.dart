part of 'panchang_cubit.dart';

abstract class PanchangState extends Equatable {
  const PanchangState();

  @override
  List<Object> get props => [];
}

class PanchangInitial extends PanchangState {}

class PanchangLoading extends PanchangState {}

class PanchangLoaded extends PanchangState {
  final PanchangModel panchang;
  const PanchangLoaded({required this.panchang});
  @override
  List<Object> get props => [panchang];
  @override
  String toString() => 'PanchangLoaded { data: $panchang }';
}

class PanchangError extends PanchangState {
  final String message;
  const PanchangError({required this.message});
  @override
  List<Object> get props => [message];

  @override
  String toString() => 'PanchangError { message: $message }';
}
