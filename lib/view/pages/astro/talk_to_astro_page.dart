import 'package:assigment/data/models/astrologer_model.dart';
import 'package:assigment/logic/astro/astro_bloc.dart';
import 'package:assigment/view/pages/astro/filter_astro_page.dart';
import 'package:assigment/view/pages/astro/search_astro_page.dart';
import 'package:assigment/view/ui_services/ui_service.dart';
import 'package:assigment/view/widgets/astro_tile_widget.dart';
import 'package:assigment/view/widgets/loading.dart';
import 'package:assigment/view/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TalkToAstroPage extends StatefulWidget {
  const TalkToAstroPage({Key? key}) : super(key: key);
  @override
  State<TalkToAstroPage> createState() => _TalkToAstroPageState();
}

class _TalkToAstroPageState extends State<TalkToAstroPage> {
  //TextEditingController _searchController = TextEditingController();
  // List<String> laungages = [];
  // List<String> skills = [];

  @override
  initState() {
    super.initState();
    BlocProvider.of<AstroBloc>(context).add(FetchAllAstro());
  }

  //it is better to play with static data, calling api multiple time is not good for performance & it will inhence the user experience
  // Future<void> _showSearchedData(
  //     BuildContext context, List<AstrologerModelData> astroesForSearch) {
  //   List<AstrologerModelData> astroes = astroesForSearch;
  //   return showModalBottomSheet(
  //       context: context,
  //       barrierColor: Colors.transparent,
  //       backgroundColor: Colors.white,
  //       isScrollControlled: true,
  //       clipBehavior: Clip.antiAliasWithSaveLayer,
  //       shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
  //       ),
  //       builder: (context) {
  //         return StatefulBuilder(
  //             builder: (BuildContext context,
  //                     void Function(void Function()) setStater) =>
  //                 DraggableScrollableSheet(
  //                   minChildSize: 0.2,
  //                   initialChildSize: 0.9,
  //                   builder: (BuildContext context,
  //                       ScrollController scrollController) {
  //                     return SingleChildScrollView(
  //                       physics: const BouncingScrollPhysics(),
  //                       child: Column(
  //                         children: [
  //                           Padding(
  //                             padding:
  //                                 const EdgeInsets.symmetric(horizontal: 16.0),
  //                             child: TextField(
  //                               controller: _searchController,
  //                               onChanged: (String search) {
  //                                 setStater(() {
  //                                   astroes = astroes
  //                                       .where((astro) =>
  //                                           astro.firstName.toString().contains(
  //                                               _searchController.text) ||
  //                                           astro.firstName
  //                                               .toString()
  //                                               .toLowerCase()
  //                                               .contains(
  //                                                   _searchController.text) ||
  //                                           astro.firstName
  //                                               .toString()
  //                                               .toUpperCase()
  //                                               .contains(
  //                                                   _searchController.text) ||
  //                                           astro.lastName.toString().contains(
  //                                               _searchController.text) ||
  //                                           astro.lastName
  //                                               .toString()
  //                                               .toLowerCase()
  //                                               .contains(
  //                                                   _searchController.text) ||
  //                                           astro.lastName
  //                                               .toString()
  //                                               .toUpperCase()
  //                                               .contains(
  //                                                   _searchController.text))
  //                                       .toList()
  //                                       .cast<AstrologerModelData>();
  //                                 });
  //                               },
  //                               decoration: InputDecoration(
  //                                   hintText: "Search",
  //                                   enabledBorder: const OutlineInputBorder(
  //                                     borderRadius: BorderRadius.all(
  //                                         Radius.circular(12.0)),
  //                                     borderSide: BorderSide(
  //                                         color: Colors.transparent, width: 2),
  //                                   ),
  //                                   focusedBorder: const OutlineInputBorder(
  //                                     borderRadius: BorderRadius.all(
  //                                         Radius.circular(10.0)),
  //                                     borderSide:
  //                                         BorderSide(color: Colors.transparent),
  //                                   ),
  //                                   border: InputBorder.none,
  //                                   filled: true,
  //                                   fillColor: Colors.grey[200],
  //                                   prefixIcon: const Icon(Icons.search),
  //                                   suffixIcon: IconButton(
  //                                     icon: const Icon(Icons.clear),
  //                                     onPressed: () {
  //                                       Navigator.pop(context);
  //                                     },
  //                                   )),
  //                             ),
  //                           ),
  //                           astroes.isEmpty
  //                               ? SingleChildScrollView(
  //                                   child: Column(
  //                                     children: [
  //                                       const SizedBox(height: 16.0),
  //                                       Text(
  //                                         "No data found",
  //                                         style: Theme.of(context)
  //                                             .textTheme
  //                                             .headline5,
  //                                       ),
  //                                       TextButton(
  //                                         onPressed: () {
  //                                           setStater(() {
  //                                             astroes = astroesForSearch;
  //                                             _searchController.clear();
  //                                           });
  //                                         },
  //                                         child: const Text(
  //                                           "search again",
  //                                           style: TextStyle(fontSize: 24.0),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 )
  //                               : ListView.separated(
  //                                   itemCount: astroes.length,
  //                                   shrinkWrap: true,
  //                                   physics:
  //                                       const NeverScrollableScrollPhysics(),
  //                                   separatorBuilder: (context, index) =>
  //                                       const Padding(
  //                                     padding: EdgeInsets.all(16.0),
  //                                     child: Divider(
  //                                         height: 2, color: Colors.black54),
  //                                   ),
  //                                   itemBuilder: (context, index) {
  //                                     return AstroTile(
  //                                         astrologer: astroes[index]);
  //                                   },
  //                                 ),
  //                         ],
  //                       ),
  //                     );
  //                   },
  //                 ));
  //       });
  // }
  // Future<void> _showFilteredData(
  //     BuildContext context, List<AstrologerModelData> astroesForFilter) {
  //   List<AstrologerModelData> astroes = astroesForFilter;

  //   return showModalBottomSheet(
  //       context: context,
  //       barrierColor: Colors.transparent,
  //       backgroundColor: Colors.white,
  //       isScrollControlled: true,
  //       clipBehavior: Clip.antiAliasWithSaveLayer,
  //       shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
  //       ),
  //       builder: (context) {
  //         return StatefulBuilder(
  //             builder: (BuildContext context,
  //                     void Function(void Function()) setStater) =>
  //                 DraggableScrollableSheet(
  //                   minChildSize: 0.2,
  //                   initialChildSize: 0.9,
  //                   builder: (BuildContext context,
  //                       ScrollController scrollController) {
  //                     return SingleChildScrollView(
  //                       physics: const BouncingScrollPhysics(),
  //                       child: Column(
  //                         children: [
  //                           Padding(
  //                             padding:
  //                                 const EdgeInsets.symmetric(horizontal: 16.0),
  //                             child: TextField(
  //                               controller: _searchController,
  //                               onChanged: (String search) {
  //                                 setStater(() {
  //                                   astroes = astroes
  //                                       .where((astro) =>
  //                                           astro.firstName.toString().contains(
  //                                               _searchController.text) ||
  //                                           astro.firstName
  //                                               .toString()
  //                                               .toLowerCase()
  //                                               .contains(
  //                                                   _searchController.text) ||
  //                                           astro.firstName
  //                                               .toString()
  //                                               .toUpperCase()
  //                                               .contains(
  //                                                   _searchController.text) ||
  //                                           astro.lastName.toString().contains(
  //                                               _searchController.text) ||
  //                                           astro.lastName
  //                                               .toString()
  //                                               .toLowerCase()
  //                                               .contains(
  //                                                   _searchController.text) ||
  //                                           astro.lastName
  //                                               .toString()
  //                                               .toUpperCase()
  //                                               .contains(
  //                                                   _searchController.text))
  //                                       .toList()
  //                                       .cast<AstrologerModelData>();
  //                                 });
  //                               },
  //                               decoration: InputDecoration(
  //                                   hintText: "Search",
  //                                   enabledBorder: const OutlineInputBorder(
  //                                     borderRadius: BorderRadius.all(
  //                                         Radius.circular(12.0)),
  //                                     borderSide: BorderSide(
  //                                         color: Colors.transparent, width: 2),
  //                                   ),
  //                                   focusedBorder: const OutlineInputBorder(
  //                                     borderRadius: BorderRadius.all(
  //                                         Radius.circular(10.0)),
  //                                     borderSide:
  //                                         BorderSide(color: Colors.transparent),
  //                                   ),
  //                                   border: InputBorder.none,
  //                                   filled: true,
  //                                   fillColor: Colors.grey[200],
  //                                   prefixIcon: const Icon(Icons.search),
  //                                   suffixIcon: IconButton(
  //                                     icon: const Icon(Icons.clear),
  //                                     onPressed: () {
  //                                       Navigator.pop(context);
  //                                     },
  //                                   )),
  //                             ),
  //                           ),
  //                           astroes.isEmpty
  //                               ? SingleChildScrollView(
  //                                   child: Column(
  //                                     children: [
  //                                       const SizedBox(height: 16.0),
  //                                       Text(
  //                                         "No data found",
  //                                         style: Theme.of(context)
  //                                             .textTheme
  //                                             .headline5,
  //                                       ),
  //                                       TextButton(
  //                                         onPressed: () {
  //                                           setStater(() {
  //                                             astroes = astroesForFilter;
  //                                             _searchController.clear();
  //                                           });
  //                                         },
  //                                         child: const Text(
  //                                           "search again",
  //                                           style: TextStyle(fontSize: 24.0),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 )
  //                               : ListView.separated(
  //                                   itemCount: astroes.length,
  //                                   shrinkWrap: true,
  //                                   physics:
  //                                       const NeverScrollableScrollPhysics(),
  //                                   separatorBuilder: (context, index) =>
  //                                       const Padding(
  //                                     padding: EdgeInsets.all(16.0),
  //                                     child: Divider(
  //                                         height: 2, color: Colors.black54),
  //                                   ),
  //                                   itemBuilder: (context, index) {
  //                                     return AstroTile(
  //                                         astrologer: astroes[index]);
  //                                   },
  //                                 ),
  //                         ],
  //                       ),
  //                     );
  //                   },
  //                 ));
  //       });
  // }

  void _showPopupMenu(AstrologerModel astrologerModel) async {
    await showMenu<bool>(
      context: context,
      semanticLabel: "Sort by",
      position: const RelativeRect.fromLTRB(32, 136, 0, 0),
      items: [
        PopupMenuItem<bool>(
            child: const Text('Exprence - High to low'),
            onTap: () {
              BlocProvider.of<AstroBloc>(context).add(SortAstro(
                  astrologers: astrologerModel, experienceHighToLow: true));
            }),
        PopupMenuItem<bool>(
            child: const Text('Exprence - Low to high'),
            onTap: () {
              BlocProvider.of<AstroBloc>(context).add(SortAstro(
                  astrologers: astrologerModel, experienceLowToHigh: true));
            }),
        PopupMenuItem<bool>(
            child: const Text('Price - High to low'),
            onTap: () {
              BlocProvider.of<AstroBloc>(context).add(SortAstro(
                  astrologers: astrologerModel, priceHighToLow: true));
            }),
        PopupMenuItem<bool>(
            child: const Text('Price - Low to high'),
            onTap: () {
              BlocProvider.of<AstroBloc>(context).add(SortAstro(
                  astrologers: astrologerModel, priceLowToHigh: true));
            }),
      ],
      elevation: 8.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(),
        body: BlocConsumer<AstroBloc, AstroState>(
          listener: (context, state) {
            if (state is AstroErrorState) {
              showMessage(context, "Error", state.message);
            }
          },
          builder: (context, state) {
            if (state is AstroLoadingState) {
              return const Loading();
            } else if (state is AstroLoadedState) {
              List<AstrologerModelData> astrologers = state.astrologers.data!;
              if (astrologers.isEmpty) {
                return const Center(child: Text('No astrologers found'));
              }
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    AppBar(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      title: const Text('Talk to an Astrologer',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0)),
                      actions: [
                        IconButton(
                          icon: Image.asset(
                            "assets/images/search.png",
                          ),
                          onPressed: () {
                            // _showSearchedData(context, astrologers);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    fullscreenDialog: true,
                                    builder: (BuildContext context) {
                                      return SearchAstroPage(
                                          astroes: astrologers);
                                    }));
                          },
                        ),
                        IconButton(
                          icon: Image.asset(
                            "assets/images/filter.png",
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    fullscreenDialog: true,
                                    builder: (BuildContext context) {
                                      return FilterAstroPage(
                                          astroes: astrologers);
                                    }));
                          },
                        ),
                        IconButton(
                          icon: Image.asset(
                            "assets/images/sort.png",
                          ),
                          onPressed: () {
                            _showPopupMenu(state.astrologers);
                          },
                        )
                      ],
                    ),
                    ListView.separated(
                      itemCount: astrologers.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Divider(height: 2, color: Colors.black54),
                      ),
                      itemBuilder: (context, index) {
                        // var astrologer = astrologers[index];
                        // for (AstrologerModelLanguage element
                        //     in (astrologer.languages ?? [])) {
                        //   laungages.add(element.name ?? '');
                        // }
                        // for (AstrologerModelSkill element
                        //     in (astrologer.skills ?? [])) {
                        //   skills.add(element.name ?? '');
                        // }
                        // print(laungages.toSet().toList());
                        // print(skills.toSet().toList());
                        return AstroTile(astrologer: astrologers[index]);
                      },
                    ),
                  ],
                ),
              );
            }
            return const Center(child: Text("something went wrong"));
          },
        ));
  }
}
