import 'package:get/get.dart';
import 'package:gr_planner/screens/auth/login/login_screen.dart';
import 'package:gr_planner/screens/group/group_screen.dart';
import 'package:gr_planner/screens/home/event/event_screen.dart';
import 'package:gr_planner/screens/home/home_screen.dart';
import 'package:gr_planner/screens/main/main_screen.dart';
import 'package:gr_planner/screens/note/note_screen.dart';

class GetRoutes {
  static const String index = "/";
  static const String home = "/home";
  static const String group = "/group";
  static const String note = "/note";
  static const String login = "/login";
  static const String event = "/event";

  static List<GetPage> routes = [
    GetPage(name: index, page: () => MainScreen()),
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: group, page: () => const GroupScreen()),
    GetPage(name: note, page: () => const NoteScreen()),
    GetPage(name: login, page: () => const LoginScreen()),
  
    GetPage(name: event, page: () =>  const EventDetailsScreen()),
  ];
}
