import 'package:flutter/material.dart';
import 'package:flutter_note_app/core/controllers/note_controller.dart';
import 'package:flutter_note_app/core/models/note_model.dart';
import 'package:flutter_note_app/ui/pages/add_note_page.dart';
import 'package:flutter_note_app/ui/pages/timer_page.dart';
import 'package:flutter_note_app/ui/styles/colors.dart';
import 'package:flutter_note_app/ui/styles/text_styles.dart';
import 'package:flutter_note_app/ui/widgets/icon_button.dart';
import 'package:get/get.dart';

class NoteDetailPage extends StatelessWidget {
  final Note note;
  final _noteController = Get.find<NoteController>();
  NoteDetailPage({@required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FloatingActionButton(
          backgroundColor: Color(0xFF3B3B3B),
          onPressed: () {
            Get.to(() => AddNotePage(
                  isUpdate: true,
                  note: note,
                ));
          },
          child: Icon(Icons.edit),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _appBar(),
            _body(),
          ],
        ),
      ),
    );
  }

  _appBar() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyIconButton(
            onTap: () {
              Get.back();
            },
            icon: Icons.keyboard_arrow_left,
          ),
          MyIconButton(
            onTap: () {
              _deleteNoteFromDB();
              Get.back();
            },
            icon: Icons.delete,
          ),
          MyIconButton(
            onTap: () {
              int activityTime =
                  (note.activityMinutes * 60) + note.activitySeconds;
              int restTime = (note.restMinutes * 60) + note.restSeconds;
              Get.to(
                TimerPage(
                    activityTime: activityTime,
                    restTime: restTime,
                    rounds: note.rounds),
                transition: Transition.downToUp,
              );
            },
            icon: Icons.play_circle_fill,
          ),
        ],
      ),
    );
  }

  _body() {
    return Expanded(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: titleTextStyle,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'فعالیت :      ${note.activityMinutes}:${note.activitySeconds}',
              style: titleTextStyle,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'استراحت :      ${note.restMinutes}:${note.restSeconds}',
              style: titleTextStyle,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'دور :      ${note.rounds}',
              style: titleTextStyle,
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }

  _deleteNoteFromDB() async {
    await _noteController.deleteNote(note: note);
  }
}
