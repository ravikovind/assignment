import 'package:assigment/data/models/astrologer_model.dart';
import 'package:assigment/data/services/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'astro_event.dart';
part 'astro_state.dart';

class AstroBloc extends Bloc<AstroEvent, AstroState> {
  AstroBloc() : super(AstroInitial()) {
    on<AstroEvent>((event, emit) async {
      if (event is FetchAllAstro) {
        await _fetchAstrologers(emit);
      } else if (event is SortAstro) {
        _sortAstro(emit, event);
      }
    });
  }

  void _sortAstro(Emitter<AstroState> emit, SortAstro event) {
    emit(AstroLoadingState());
    try {
      AstrologerModel astrologers = event.astrologers;
      if (event.priceLowToHigh) {
        (astrologers.data ?? []).sort((a, b) => a.additionalPerMinuteCharges!
            .compareTo(b.additionalPerMinuteCharges!));
        emit(AstroLoadedState(astrologers: astrologers));
      } else if (event.priceHighToLow) {
        (astrologers.data ?? []).sort((a, b) => b.additionalPerMinuteCharges!
            .compareTo(a.additionalPerMinuteCharges!));
        emit(AstroLoadedState(astrologers: astrologers));
      } else if (event.experienceLowToHigh) {
        (astrologers.data ?? [])
            .sort((a, b) => a.experience!.compareTo(b.experience!));
        emit(AstroLoadedState(astrologers: astrologers));
      } else if (event.experienceHighToLow) {
        (astrologers.data ?? [])
            .sort((a, b) => b.experience!.compareTo(a.experience!));
        emit(AstroLoadedState(astrologers: astrologers));
      }
    } on Exception catch (e) {
      emit(AstroErrorState(message: e.toString()));
    }
  }

  Future<void> _fetchAstrologers(Emitter<AstroState> emit) async {
    emit(AstroLoadingState());
    try {
      final Map<String, dynamic> _apiResponse =
          await APIService.fetchAllAgents();
      if (_apiResponse['status'] == true) {
        final AstrologerModel _astrologers = _apiResponse['data'];
        emit(AstroLoadedState(astrologers: _astrologers));
      } else {
        emit(AstroErrorState(message: _apiResponse['message']));
      }
    } on Exception catch (e) {
      emit(AstroErrorState(message: e.toString()));
    }
  }
}
