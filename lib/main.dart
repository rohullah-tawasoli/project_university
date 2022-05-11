import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_note_app/core/controllers/dashboard_binding.dart';
import 'package:flutter_note_app/core/controllers/note_controller.dart';
import 'package:flutter_note_app/core/db/db_helper.dart';
import 'package:flutter_note_app/ui/pages/mydashboard_page.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    final NoteController noteController = Get.put(NoteController());
    return GetMaterialApp(
      title: "Flutter Note App",
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        GetPage(
          name: '/',
          page: () => MyDashBoard(),
          binding: DashboardBinding(),
        ),
      ],
    );
  }
}
