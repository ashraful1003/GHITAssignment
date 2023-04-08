import 'package:ashraful/constants.dart';
import 'package:ashraful/model/all_info_model.dart';
import 'package:ashraful/model/api_response.dart';
import 'package:ashraful/services/list_of_services.dart';
import 'package:ashraful/views/screens/first/components/toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'components/asteroid_card.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List<bool> isSelected = List.generate(2, (_) => false);

  ListOfServices get listOfServices => GetIt.instance<ListOfServices>();

  APIResponse<AllInfoModel>? apiResponse;
  int? itemCount;

  List<NearEarthObject> nearObject = [];

  getAsteroid() async {
    apiResponse = await listOfServices.getAsteroidInfo();

    if (apiResponse != null && !apiResponse!.error) {
      setState(() {
        apiResponse!.data!.nearEarthObjects.forEach((key, value) {
          for (var item in value) {
            nearObject.add(item);
          }
        });

        itemCount = apiResponse!.data!.elementCount;
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
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          ToggleButtons(
            color: Colors.lightBlue,
            children: [
              /// created custom toggle btn for reducing redundancy
              ToggleBtn(btnName: "Close Date", isSelected: isSelected[0]),
              ToggleBtn(btnName: "Velocity", isSelected: isSelected[1]),
            ],
            isSelected: isSelected,

            /// sorted the list comparing with other components
            onPressed: (index) {
              setState(() {
                isSelected[index] = !isSelected[index];
                /// for close date
                if (index == 0 && isSelected[index]) {
                  nearObject.sort((a, b) => a
                      .closeApproachData[0].closeApproachDate
                      .compareTo(b.closeApproachData[0].closeApproachDate));
                } else if (index == 0 && !isSelected[index]) {
                  nearObject.sort((a, b) => b
                      .closeApproachData[0].closeApproachDate
                      .compareTo(a.closeApproachData[0].closeApproachDate));
                }
                /// for velocity
                if (index == 1 && isSelected[index]) {
                  nearObject.sort((a, b) => a
                      .closeApproachData[0].relativeVelocity.kilometersPerHour
                      .compareTo(b.closeApproachData[0].relativeVelocity
                          .kilometersPerHour));
                } else if (index == 1 && !isSelected[index]) {
                  nearObject.sort((a, b) => b
                      .closeApproachData[0].relativeVelocity.kilometersPerHour
                      .compareTo(a.closeApproachData[0].relativeVelocity
                          .kilometersPerHour));
                }
              });
            },
          )
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Date: $date",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white),
                  ),
                ),
                Container(
                  child: itemCount == nearObject.length
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: nearObject.length,
                          itemBuilder: (context, index) {
                            return AsteroidCard(
                              objects: nearObject[index],
                            );
                          },
                        )
                      : const Center(child: CircularProgressIndicator()),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
