import 'dart:convert';

import 'package:ashraful/model/all_info_model.dart';
import 'package:ashraful/model/api_response.dart';
import 'package:ashraful/constants.dart';
import 'package:http/http.dart' as http;

class ListOfServices {
  Future<APIResponse<AllInfoModel>> getAsteroidInfo() {
    var myHeaders = {
      'Content-Type': 'application/json',
    };

    Uri apiUrl = Uri.parse(APIROOT);

    return http.get(apiUrl, headers: myHeaders).then((value) {
      if (value.statusCode == 200) {
        final jsonData = json.decode(value.body);
        AllInfoModel? infoModel;

        infoModel = AllInfoModel.fromJson(jsonData);

        return APIResponse<AllInfoModel>(data: infoModel);
      }

      /// if there is any status error it will return the status code
      return APIResponse<AllInfoModel>(
          error: true, errorMessage: value.statusCode.toString());
    }).catchError((e) => APIResponse<AllInfoModel>(
          /// if something else error is happened
          error: true,
          errorMessage: e.toString(),
        ));
  }
}
