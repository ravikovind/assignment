// ignore_for_file: avoid_print
import 'package:assigment/data/models/astrologer_model.dart';
import 'package:assigment/logic/astro/filter_astro_cubit.dart';
import 'package:assigment/logic/astro/search_astro_cubit.dart';
import 'package:assigment/view/ui_services/ui_service.dart';
import 'package:assigment/view/widgets/astro_tile_widget.dart';
import 'package:assigment/view/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterAstroPage extends StatefulWidget {
  final List<AstrologerModelData> astroes;
  const FilterAstroPage({Key? key, required this.astroes}) : super(key: key);

  @override
  State<FilterAstroPage> createState() => _FilterAstroPageState();
}

class _FilterAstroPageState extends State<FilterAstroPage> {
  bool _isLoading = false;
  List<String> laungages = [];
  List<String> skills = [];
  List<bool> laungagesValue = [];
  List<bool> skillsValue = [];
  List<String> laungagesSelceted = [];
  List<String> skillsSelceted = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });
    getLaungagesAndSkills();
    setState(() {
      _isLoading = false;
    });
  }

  void getLaungagesAndSkills() {
    for (var astro in widget.astroes) {
      for (AstrologerModelLanguage element in (astro.languages ?? [])) {
        laungages.add(element.name ?? '');
      }
      for (AstrologerModelSkill element in (astro.skills ?? [])) {
        skills.add(element.name ?? '');
      }
      skills = skills.toSet().toList();
      laungages = laungages.toSet().toList();
      skillsValue = List.filled(skills.length, false);
      laungagesValue = List.filled(laungages.length, false);
      print(laungages.toSet().toList());
      print(skills.toSet().toList());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('find Astrologer',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        // floatingActionButton:
        //     laungagesSelceted.isEmpty && skillsSelceted.isEmpty
        //         ? const SizedBox()
        //         : FloatingActionButton.extended(
        //             shape: const RoundedRectangleBorder(
        //                 borderRadius: BorderRadius.all(Radius.circular(12.0))),
        //             onPressed: () {
        //               BlocProvider.of<FilterAstroCubit>(context).filter(
        //                   widget.astroes, laungagesSelceted, skillsSelceted);
        //               setState(() {
        //                 _isExpanded = !_isExpanded;
        //               });
        //             },
        //             icon: const Icon(Icons.filter_list),
        //             label: const Text('Filter Astrologers',
        //                 style: TextStyle(fontSize: 16.0)),
        //           ),

        body: _isLoading
            ? const Loading()
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ExpansionTile(
                      // initiallyExpanded: _isExpanded,
                      onExpansionChanged: (bool isExpanded) {
                        if (!isExpanded) {
                          if (skills.isNotEmpty && laungages.isNotEmpty) {
                            BlocProvider.of<FilterAstroCubit>(context).filter(
                                widget.astroes,
                                laungagesSelceted,
                                skillsSelceted);
                          }
                        }
                      },
                      title: const Text(
                        'Filter',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'Select Languages and Skills to filter Astrologers',
                      ),
                      children: [
                        const Text(
                          'Laungages',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        ListView.builder(
                          itemCount: laungages.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return CheckboxListTile(
                              title: Text(laungages[index]),
                              value: laungagesValue[index],
                              dense: true,
                              onChanged: (value) {
                                setState(() {
                                  laungagesValue[index] = value!;
                                  if (laungagesValue[index]) {
                                    laungagesSelceted.add(laungages[index]);
                                  } else {
                                    laungagesSelceted.remove(laungages[index]);
                                  }
                                });
                              },
                            );
                          },
                        ),
                        const Text(
                          'Skills',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        ListView.builder(
                          itemCount: skills.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return CheckboxListTile(
                              title: Text(skills[index]),
                              value: skillsValue[index],
                              dense: true,
                              onChanged: (value) {
                                setState(() {
                                  skillsValue[index] = value!;
                                  if (skillsValue[index]) {
                                    skillsSelceted.add(skills[index]);
                                  } else {
                                    skillsSelceted.remove(skills[index]);
                                  }
                                });
                              },
                            );
                          },
                        ),
                        const Text(
                          'Close tile for filter',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    laungagesSelceted.isNotEmpty
                        ? Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                                'Selceted Laungages\n${laungagesSelceted.join(', ')}',
                                textAlign: TextAlign.start,
                                style: Theme.of(context).textTheme.bodyText1),
                          )
                        : const SizedBox(),
                    const SizedBox(height: 8.0),
                    skillsSelceted.isNotEmpty
                        ? Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                                'Selceted Skills\n${skillsSelceted.join(', ')}',
                                textAlign: TextAlign.start,
                                style: Theme.of(context).textTheme.bodyText1),
                          )
                        : const SizedBox(),

                    //Selceted Languages\n${laungagesSelceted.join(', ')}
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    //   child: TextField(
                    //     controller: _searchController,
                    //     onChanged: (value) =>
                    //         context.read<SearchAstroCubit>().search(value, astroes),
                    //     decoration: InputDecoration(
                    //         hintText: "Search",
                    //         enabledBorder: const OutlineInputBorder(
                    //           borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    //           borderSide:
                    //               BorderSide(color: Colors.transparent, width: 2),
                    //         ),
                    //         focusedBorder: const OutlineInputBorder(
                    //           borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    //           borderSide: BorderSide(color: Colors.transparent),
                    //         ),
                    //         border: InputBorder.none,
                    //         filled: true,
                    //         fillColor: Colors.grey[200],
                    //         prefixIcon: const Icon(Icons.search),
                    //         suffixIcon: IconButton(
                    //           icon: const Icon(Icons.clear),
                    //           onPressed: () {
                    //             Navigator.pop(context);
                    //           },
                    //         )),
                    //   ),
                    // ),
                    const SizedBox(height: 8.0),
                    BlocConsumer<FilterAstroCubit, FilterAstroState>(
                      listener: (context, state) {
                        if (state is FilterAstroFailure) {
                          showMessage(context, 'Error', state.error);
                        }
                      },
                      builder: (context, state) {
                        if (state is SearchAstroLoading) {
                          return const Loading();
                        } else if (state is FilterAstroSuccess) {
                          return ListView.separated(
                            itemCount: state.astroesFiltered.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) => const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Divider(height: 2, color: Colors.black54),
                            ),
                            itemBuilder: (context, index) {
                              return AstroTile(
                                  astrologer: state.astroesFiltered[index]);
                            },
                          );
                        }
                        return ListView.separated(
                          itemCount: widget.astroes.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) => const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Divider(height: 2, color: Colors.black54),
                          ),
                          itemBuilder: (context, index) {
                            return AstroTile(astrologer: widget.astroes[index]);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ));
  }
}
