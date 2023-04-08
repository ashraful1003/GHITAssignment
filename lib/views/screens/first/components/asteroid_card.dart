import 'package:ashraful/model/all_info_model.dart';
import 'package:ashraful/views/screens/first/components/text_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AsteroidCard extends StatelessWidget {
  NearEarthObject objects;

  AsteroidCard({super.key, required this.objects});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.all(5),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),

        /// as mentioned if the Is_potentially_hazardous_asteroid is true/false
        /// color will be changed accordingly
        ///
        /// in question there is value of alpha(argb) but the value cannot be
        /// double so I assumed that the given value is actually opacity
        color: objects.isPotentiallyHazardousAsteroid
            ? const Color.fromRGBO(0, 0, 0, 0.3)
            : const Color.fromRGBO(255, 255, 255, 0.8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// custom text view for reducing redundancy
          TextView(
            field: "Name",
            value: objects.name,
          ),
          TextView(
            field: "Magnitude",
            value: objects.absoluteMagnitudeH.toString(),
          ),
          TextView(
            field: "Close Approach Date",
            value: DateFormat('yyyy-MM-dd').format(objects.closeApproachData[0].closeApproachDate),
          ),
          TextView(
            field: "Is_potentially_hazardous_asteroid",
            value:
                objects.isPotentiallyHazardousAsteroid.toString().toUpperCase(),
          ),
          TextView(
            field: "Relative_velocity (Km/h)",
            value:
                objects.closeApproachData[0].relativeVelocity.kilometersPerHour,
          ),
        ],
      ),
    );
  }
}
