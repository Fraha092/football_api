import 'dart:developer';

import 'package:get/get.dart';
import 'package:football_api/model/footballmodel.dart';
import 'package:football_api/services/services.dart';

class AppController extends GetxController {
//  var getposts = Footballmodel?().obs;
  var getposts = Footballmodel().obs;

  Services services = Services();
  var postloading = true.obs;

  @override
  void onInit() {
    callpostmethod();
    super.onInit();
  }

  callpostmethod() async {
    try {
      postloading.value = true;
      var result = await services.getallposts();
      if (result != null) {
       // var todos = await services.getallposts();

        getposts.value = result;
      } else {
        print("null");
      }
    } finally {
      postloading.value = false;
    }
    update();
  }
}