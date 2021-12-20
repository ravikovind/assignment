import 'package:assigment/data/models/astrologer_model.dart';
import 'package:assigment/logic/astro/search_astro_cubit.dart';
import 'package:assigment/view/ui_services/ui_service.dart';
import 'package:assigment/view/widgets/astro_tile_widget.dart';
import 'package:assigment/view/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchAstroPage extends StatelessWidget {
  final List<AstrologerModelData> astroes;
  const SearchAstroPage({Key? key, required this.astroes}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Search an Astrologer',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) =>
                      context.read<SearchAstroCubit>().search(value, astroes),
                  decoration: InputDecoration(
                      hintText: "Search",
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 2),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.grey[200],
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )),
                ),
              ),
              BlocConsumer<SearchAstroCubit, SearchAstroState>(
                listener: (context, state) {
                  if (state is SearchAstroFailure) {
                    showMessage(context, 'Error', state.error);
                  }
                },
                builder: (context, state) {
                  if (state is SearchAstroLoading) {
                    return Loading(
                      eventName: 'Searching ${_searchController.text}...',
                    );
                  } else if (state is SearchAstroSuccess) {
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
                    itemCount: astroes.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Divider(height: 2, color: Colors.black54),
                    ),
                    itemBuilder: (context, index) {
                      return AstroTile(astrologer: astroes[index]);
                    },
                  );
                },
              ),
            ],
          ),
        ));
  }
}
