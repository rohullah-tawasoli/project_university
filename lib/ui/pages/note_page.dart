import 'package:flutter/material.dart';
import 'package:flutter_note_app/core/controllers/note_controller.dart';
import 'package:flutter_note_app/ui/pages/add_note_page.dart';
import 'package:flutter_note_app/ui/styles/colors.dart';
import 'package:flutter_note_app/ui/widgets/icon_button.dart';
import 'package:flutter_note_app/ui/widgets/note_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class NotePage extends StatelessWidget {
  final _notesController = Get.put(NoteController());

  final _tileCounts = [
    StaggeredTile.count(2, 2),
    StaggeredTile.count(2, 2),
    StaggeredTile.count(2, 2),
    StaggeredTile.count(2, 2),
    StaggeredTile.count(2, 2),
    StaggeredTile.count(2, 2),
    StaggeredTile.count(2, 2),
  ];
  final _tileTypes = [
    TileType.Square,
    TileType.Square,
    TileType.VerRect,
    TileType.Square,
    TileType.VerRect,
    TileType.Square,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FloatingActionButton(
          backgroundColor: Color(0xFF3B3B3B),
          onPressed: () {
            Get.to(
              AddNotePage(),
              transition: Transition.downToUp,
            );
          },
          child: Icon(Icons.add),
        ),
      ),
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            _appBar(),
            const SizedBox(
              height: 16,
            ),
            _body(),
          ],
        ),
      ),
    );
  }

  _appBar() {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyIconButton(
            onTap: () {},
            icon: Icons.search,
          ),
          Text(
            "نوتیفیکیشن",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontFamily: 'Shabnam',
            ),
          ),
        ],
      ),
    );
  }

  _body() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(() {
        print("######## " + _notesController.noteList.length.toString());
        if (_notesController.noteList.isNotEmpty) {
          return StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              itemCount: _notesController.noteList.length,
              itemBuilder: (context, index) {
                return NoteTile(
                  tileType: _tileTypes[index % 7],
                  note: _notesController.noteList[index],
                );
              },
              staggeredTileBuilder: (int index) => _tileCounts[index % 7]);
        } else {
          return Center(
            child: Text(
              "دیتابیس خالی است",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Shabnam',
              ),
            ),
          );
        }
      }),
    ));
  }
}
