import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_u_l/Controller/news_controller.dart';
import 'package:news_u_l/View/widgets/category_widget.dart';
import 'package:news_u_l/View/widgets/home_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(NewsController());
  final pageController = PageController();

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
            body: PageView(
              onPageChanged: (index) {
                controller.changeNavBar(currentIndex: index);
              },
              controller: pageController,
              children: const [HomeWidget(), CategoryWidget()],
            ),
            bottomNavigationBar:
                GetBuilder<NewsController>(builder: (controller) {
              return BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: controller.index,
                onTap: (index) {
                  controller.changeNavBar(currentIndex: index);
                  pageController.jumpToPage(index);
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_max_outlined),
                    activeIcon: Icon(Icons.home),
                    label: 'Home',
                    tooltip: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.category_outlined),
                    activeIcon: Icon(Icons.category),
                    label: 'Category',
                    tooltip: "Category",
                  ),
                ],
              );
            })));
  }
}
