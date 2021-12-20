import 'package:assigment/data/models/astrologer_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'search_astro_state.dart';

class SearchAstroCubit extends Cubit<SearchAstroState> {
  SearchAstroCubit() : super(SearchAstroInitial());

  //search by name
  void search(String query, List<AstrologerModelData> astroes) async {
    emit(SearchAstroLoading());
    try {
      List<AstrologerModelData> astroesFiltered = astroes
          .where((element) =>
              element.firstName!.contains(query) ||
              element.lastName!.contains(query) ||
              element.firstName!.toString().toLowerCase().contains(query) ||
              element.lastName!.toString().toLowerCase().contains(query))
          .toList()
          .cast<AstrologerModelData>();
      // List<AstrologerModelData> astroesFiltedSkillsLanguages = [];
      // for (AstrologerModelData element in astroesFiltered) {
      //   astroesFiltedSkillsLanguages = element.languages!
      //       .where((element) => element.name!.contains(query))
      //       .cast<AstrologerModelData>()
      //       .toList();
      //   astroesFiltedSkillsLanguages = element.skills!
      //       .where((element) => element.name!.contains(query))
      //       .cast<AstrologerModelData>()
      //       .toList();
      // }
      // astroesFiltered.addAll(astroesFiltedSkillsLanguages);
      // astroesFiltered.where((element) {
      //   element.languages!
      //       .where((element) => element.name!.contains(query))
      //       .toList();
      // });
      emit(SearchAstroSuccess(astroesFiltered: astroesFiltered));
    } on Exception catch (e) {
      emit(SearchAstroFailure(error: e.toString()));
    }
  }
}
