import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return await Get.dialog(
            AlertDialog(
              title: const Text('Closing the app'),
              content: const Text('Are you sure close the app '),
              actions: [
                ElevatedButton(onPressed: (){
                  Get.back(result: true); //Exit the entire application
                }, child: const Text('close')),
                ElevatedButton(onPressed: (){
                  Get.back();
                }, child: const Text('cancel')),
              ],
            ),
          );
        },
        child: Scaffold(
          appBar: AppBar(),
        ));
  }
}
