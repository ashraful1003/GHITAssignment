import 'package:ashraful/model/all_info_model.dart';
import 'package:ashraful/model/api_response.dart';
import 'package:ashraful/services/list_of_services.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'asteroid_card.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  ListOfServices get listOfServices => GetIt.instance<ListOfServices>();

  APIResponse<AllInfoModel>? apiResponse;

  List<NearEarthObject> nearObject = [];

  getAsteroid() async {
    apiResponse = await listOfServices.getAsteroidInfo();

    if (apiResponse != null && !apiResponse!.error) {
      NearEarthObject object;

      apiResponse!.data!.nearEarthObjects.forEach((key, value) {
        nearObject = value;
      });
    } else {
      print(apiResponse!.errorMessage.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAsteroid();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          child: Text("2023-01-01"),
        ),
        AsteroidCard(
          objects: nearObject,
        )
      ],
    ));
  }
}
