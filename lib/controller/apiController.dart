import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogja_streamers/config/api/api.dart';

import '../bloc/radio_list_bloc.dart';
import '../model/stationModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class fetchAPI {
  Future<List<Station>> fetchRadio(BuildContext context) async {
    String url = API.link;

    //debug_print
    print(url);

    var response = await http.get(Uri.parse(url), headers: API.requestHeaders);
    var decode = json.decode(response.body);
    print(decode["stations"].length);
    List<Station> list_radio = [];
    RadioListBloc bloc = BlocProvider.of<RadioListBloc>(context);
    for (var i = 0; i < decode['stations'].length; i++) {
      list_radio.add(Station(
          radioId: decode['stations'][i]["radio_id"].toString(),
          radioName: decode['stations'][i]["radio_name"].toString(),
          radioImage: decode['stations'][i]["radio_image"].toString(),
          radioUrl: decode['stations'][i]["radio_url"].toString(),
          genre: decode['stations'][i]["genre"].toString(),
          countryId: decode['stations'][i]["country_id"].toString(),
          countryName: decode['stations'][i]["country_name"].toString(),
          countryFlag: decode['stations'][i]["country_flag"].toString()));
    }
    bloc.emit(list_radio);
    return list_radio;
  }
}
