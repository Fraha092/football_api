import 'package:flutter/material.dart';
import 'package:football_api/controller/appcontroller.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var controller = Get.put(AppController());

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Obx(() {
            return controller.postloading.value ? Center(
              child: CircularProgressIndicator(),
            )
                : ListView.builder(
                itemCount: controller.getposts.value.clubs?.length,
                itemBuilder: (context,index){
                  var item=controller.getposts.value.clubs?[index];
                  return Card(
                    child: ListTile(
                      title: Text(item?.name ?? ""),
                      subtitle: Text(item?.country ?? ""),
                      leading: Text(item?.code ?? ""),
                    ),
                  );
                });
          }

          ))
        ],
      ),
    );
  }
}
