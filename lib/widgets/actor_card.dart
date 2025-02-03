import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/screens/actor_details_screen.dart';

import '../api/api.dart';
import '../models/actor.dart';

class ActorCard extends StatelessWidget {
  final Actor actor;

  const ActorCard({super.key, required this.actor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Get.to(ActorDetailsScreen(
              actor: actor,
            )),
        child: Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Padding(
                    padding: EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: SizedBox(
                          width: 80,
                          height: 120,
                          child: Image(
                            image: NetworkImage(actor.profile_path != ""
                                ? "${Api.imageBaseUrl}${actor.profile_path}"
                                : "https://i.ibb.co/QKg4NRx/115-1150053-avatar-png-transparent-png-royalty-free-default-user-1744388177.jpg"),
                            fit: BoxFit.cover,
                          )),
                    )),
                Text(actor.name)
              ],
            )));
  }
}
