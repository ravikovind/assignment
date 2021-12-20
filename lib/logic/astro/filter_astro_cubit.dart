import 'package:assigment/data/models/astrologer_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'filter_astro_state.dart';

class FilterAstroCubit extends Cubit<FilterAstroState> {
  FilterAstroCubit() : super(FilterAstroInitial());

  void filter(List<AstrologerModelData> astroes, List<String> laungages,
      List<String> skills) {
    emit(FilterAstroLoading());
    if (skills.isNotEmpty || laungages.isNotEmpty) {
      List<AstrologerModelData> astroesFiltered = [];
      for (var astro in astroes) {
        //var a  = astro.languages!.where((element) => laungages.contains(element.name)).toList();
        for (AstrologerModelLanguage language in (astro.languages ?? [])) {
          if (laungages.contains(language.name)) {
            astroesFiltered.add(astro);
          }
        }
        for (AstrologerModelSkill skill in (astro.skills ?? [])) {
          if (skills.contains(skill.name)) {
            astroesFiltered.add(astro);
          }
        }
      }
      emit(FilterAstroSuccess(astroesFiltered.toSet().toList()));
    } else {
      emit(FilterAstroSuccess(astroes));
    }
  }
}
