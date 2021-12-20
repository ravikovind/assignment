import 'package:assigment/data/models/panchang_model.dart';
import 'package:assigment/data/services/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'panchang_state.dart';

class PanchangCubit extends Cubit<PanchangState> {
  PanchangCubit() : super(PanchangInitial());

  Future<void> getPanchang(int day, int month, int year, String placeId) async {
    emit(PanchangLoading());
    try {
      final Map<String, dynamic> _apiResponse =
          await APIService.fetchPanchang(day, month, year, placeId);
      if (_apiResponse['status'] == true) {
        final PanchangModel _panchangModel = _apiResponse['data'];
        emit(PanchangLoaded(panchang: _panchangModel));
      } else {
        emit(PanchangError(message: _apiResponse['message']));
      }
    } on Exception catch (e) {
      emit(PanchangError(message: e.toString()));
    }
  }
}
