import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gr_planner/controller/bottom_navigation.dart';
import 'package:gr_planner/screens/group/group_screen.dart';
import 'package:gr_planner/screens/home/home_screen.dart';
import 'package:gr_planner/screens/note/note_screen.dart';

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
          selectedItemColor: Color(0xFF6D9B6A),
          unselectedItemColor: Colors.grey,
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
