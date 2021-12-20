import 'package:assigment/data/models/location_api_model.dart';
import 'package:assigment/data/services/api_service.dart';
import 'package:assigment/logic/panchang/panchang_cubit.dart';
import 'package:assigment/view/ui_services/ui_service.dart';
import 'package:assigment/view/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PanchangPage extends StatefulWidget {
  const PanchangPage({Key? key}) : super(key: key);

  @override
  _PanchangPageState createState() => _PanchangPageState();
}

class _PanchangPageState extends State<PanchangPage> {
  final TextEditingController _locationController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _showPopupMenu(List<LoctionApiModelData> locations) async {
    await showMenu<bool>(
      context: context,
      semanticLabel: "Select Location",
      position: RelativeRect.fromLTRB(
        MediaQuery.of(context).size.width / 2,
        MediaQuery.of(context).size.height / 1.8,
        MediaQuery.of(context).size.width / 2,
        MediaQuery.of(context).size.height / 2,
      ),
      items: locations
          .map((e) => PopupMenuItem<bool>(
                child: Text(e.placeName.toString()),
                onTap: () {
                  BlocProvider.of<PanchangCubit>(context).getPanchang(
                      _selectedDate.day,
                      _selectedDate.month,
                      _selectedDate.year,
                      e.placeId ?? "ChIJL_P_CXMEDTkRw0ZdG-0GVvw");
                },
              ))
          .toList(),
      elevation: 8.0,
    );
  }

  void _pickDateDialog() {
    showDatePicker(
            context: context,
            helpText: 'select date',
            fieldLabelText: 'select date',
            lastDate: DateTime.now().add(const Duration(days: 10)),
            firstDate: DateTime(1900),
            initialDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  void initState() {
    BlocProvider.of<PanchangCubit>(context).getPanchang(_selectedDate.day,
        _selectedDate.month, _selectedDate.year, "ChIJL_P_CXMEDTkRw0ZdG-0GVvw");
    super.initState();
  }

  // @override
  // void initState() {
  //   _locationController = TextEditingController();
  //   _locationController.addListener(() {
  //     if(!_isLoading){
  //       setState((){
  //         _isLoading = true;
  //       });
  //     }
  //   });
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _locationController.removeListener(() {
  //     if(_isLoading){
  //       setState((){
  //         _isLoading = false;
  //       });
  //     }
  //   });
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {},
                ),
                title: const Text(
                  'Daily Panchang',
                ),
              ),
              const Text(
                'India is a country known for its festival but knowing the exact dates can sometimes be difficult. To ensure you do not miss out on the critical dates we bring you the daily panchang.',
              ),
              const SizedBox(height: 8.0),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                color: Colors.orange[50],
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Text(
                            'Date : ',
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Card(
                            elevation: 0.0,
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(8.0),
                              dense: true,
                              onTap: _pickDateDialog,
                              title: Text(_selectedDate.formatMyDate(),
                                  style: const TextStyle(fontSize: 14.0)),
                              trailing: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                                size: 32.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Text(
                            'Location : ',
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            controller: _locationController,
                            onFieldSubmitted: (value) async {
                              if (value.length > 3) {
                                await APIService.fetchLocation(
                                        _locationController.text)
                                    .then((value) {
                                  if (value['status'] == true) {
                                    final LoctionApiModel _apiData =
                                        value['data'];
                                    if (_apiData.data != null) {
                                      if (_apiData.data!.isNotEmpty) {
                                        _showPopupMenu(_apiData.data!);
                                      } else {
                                        showBannerMessage(
                                            context, 'No suggestions found');
                                      }
                                    } else {
                                      showBannerMessage(
                                          context, value['meaasge']);
                                    }
                                  } else {
                                    showBannerMessage(
                                        context, value['meaasge']);
                                  }
                                });
                              }
                            },
                            decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                border: InputBorder.none,
                                filled: true,
                                hintStyle: TextStyle(
                                    fontSize: 14.0, color: Colors.black),
                                hintText: "Enter Location",
                                fillColor: Colors.white70),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
              BlocConsumer<PanchangCubit,PanchangState>(
                listener: (context, state) {
                  if (state is PanchangError) {
                    showBannerMessage(context, state.message);
                  }
                },
                builder: (context, state) {
                  if (state is PanchangLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return const Text("No Panchang is Avialable");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
