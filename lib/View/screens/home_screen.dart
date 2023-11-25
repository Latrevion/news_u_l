import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_u_l/Controller/news_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return await Get.dialog(
            AlertDialog(
              title: const Text('Closing the app'),
              content: const Text('Are you sure close the app '),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Get.back(result: true); //Exit the entire application
                    },
                    child: const Text('close')),
                ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('cancel')),
              ],
            ),
          );
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    controller.changeThemeMode();
                  },
                  icon: Icon(controller.iconTheme()))
            ],
          ),
        ));
  }
}
