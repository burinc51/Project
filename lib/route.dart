import 'package:get/get.dart';
import 'package:gr_planner/screens/group/group_screen.dart';
import 'package:gr_planner/screens/home/home_screen.dart';
import 'package:gr_planner/screens/main/main_screen.dart';
import 'package:gr_planner/screens/note/note_screen.dart';

class GetRoutes {
  static const String index = "/";
  static const String home = "/home";
  static const String group = "/group";
  static const String note = "/note";

  static List<GetPage> routes = [
    GetPage(name: index, page: () => MainScreen()),
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: group, page: () => const GroupScreen()),
    GetPage(name: note, page: () => const NoteScreen()),
  ];
}
