import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/bottom_navigation.dart';
import 'package:project/screens/group/group_screen.dart';
import 'package:project/screens/home/home_screen.dart';
import 'package:project/screens/note/note_screen.dart';

class MainScreen extends GetView<BottomNavController> {
  MainScreen({Key? key}) : super(key: key);

  final List<Widget> pages = [
    const HomeScreen(),
    const GroupScreen(),
    const NoteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // Ensure the controller is initialized
    Get.put(BottomNavController());

    return Scaffold(
      body: Obx(() => IndexedStack(
            index: controller.currentIndex.value,
            children: pages,
          )),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'Group',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.note),
              label: 'Note',
            ),
          ],
        ),
      ),
    );
  }
}
