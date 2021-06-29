import 'package:explow/model/Info.dart';
import 'package:explow/model/Show.dart';
import 'package:explow/services/infoapi/InfoApi.dart';
import 'package:get/get.dart';

class InfoController extends GetxController {
  var info = Info().obs;
  var isLoading = true.obs;

  void fetchInfo(String id) async {
    var infotemp = await InfoApi.getapi(id);
    if (infotemp != null) {
      info.value = infotemp;
      print(info.value.country);
      isLoading(false);
    }
  }
}
