import 'package:flutter_note_app/core/controllers/dashboard_contrpller.dart';
import 'package:flutter_note_app/core/controllers/home_controller.dart';
import 'package:flutter_note_app/core/controllers/note_controller.dart';
import 'package:flutter_note_app/core/controllers/profile_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<NoteController>(() => NoteController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
