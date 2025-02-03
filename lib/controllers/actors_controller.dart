import 'package:get/get.dart';
import 'package:movies/api/api_service.dart';
import 'package:movies/models/movie.dart';

import '../models/actor.dart';

// Controlador para actores. Permite añadir actores a la lista de favoritos.
class ActorsController extends GetxController {
  var isLoading = false.obs;
  var popularActors = <Actor>[].obs;
  var watchListActors = <Actor>[].obs;
  @override
  void onInit() async {
    isLoading.value = true;
    popularActors.value = (await ApiService.getPopularActors())!;
    isLoading.value = false;
    super.onInit();
  }

  bool isInWatchList(Actor actor) {
    return watchListActors.any((a) => a.id == actor.id);
  }

  void addToWatchList(Actor actor) {
    if (watchListActors.any((a) => a.id == actor.id)) {
      watchListActors.remove(actor);
      Get.snackbar('Success', 'removed from watch list',
          snackPosition: SnackPosition.BOTTOM,
          animationDuration: const Duration(milliseconds: 500),
          duration: const Duration(milliseconds: 500));
    } else {
      watchListActors.add(actor);
      Get.snackbar('Success', 'added to watch list',
          snackPosition: SnackPosition.BOTTOM,
          animationDuration: const Duration(milliseconds: 500),
          duration: const Duration(milliseconds: 500));
    }
  }
}
