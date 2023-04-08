import 'package:ashraful/model/all_info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AsteroidCard extends StatelessWidget {
  List<NearEarthObject> objects;

  AsteroidCard({super.key, required this.objects});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          // itemCount: allInfos.length,
          itemCount: objects.length,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: [
                  Text(objects[index].name),
                  Text(objects[index].absoluteMagnitudeH),
                  Text(),
                  Container(
                    color: allInfos[index].isPotentiallyHazardousAsteroid?Color.fromRGBO(0, 0, 0, 0.3):Color.fromRGBO(255, 255, 255, 0.8),
                    child: Text(allInfos[index].isPotentiallyHazardousAsteroid.toString()),
                  ),
                  Text(allInfos[index].relativeVelocity),
                ],
              ),
            );
          }),
    );
  }
}
