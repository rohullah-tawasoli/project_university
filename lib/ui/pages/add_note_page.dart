import 'package:flutter/material.dart';
import 'package:flutter_note_app/core/controllers/note_controller.dart';
import 'package:flutter_note_app/core/models/note_model.dart';
import 'package:flutter_note_app/ui/pages/note_page.dart';
import 'package:flutter_note_app/ui/styles/colors.dart';
import 'package:flutter_note_app/ui/styles/text_styles.dart';
import 'package:flutter_note_app/ui/widgets/icon_button.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddNotePage extends StatefulWidget {
  final bool isUpdate;
  final Note note;
  AddNotePage({this.isUpdate = false, this.note});

  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  TextEditingController _titleTextController = TextEditingController();
  final NoteController _noteController = Get.find<NoteController>();
  DateTime _currentDate = DateTime.now();
  final _activityMinutesController = TextEditingController();
  final _activitySecondsController = TextEditingController();
  final _restMinutesController = TextEditingController();
  final _restSecondsController = TextEditingController();
  final _roundController = TextEditingController();

  @override
  void initState() {
    if (widget.isUpdate) {
      _titleTextController.text = "${widget.note.title}";
      _activityMinutesController.text = "${widget.note.activityMinutes}";
      _restMinutesController.text = "${widget.note.restMinutes}";
      _restSecondsController.text = "${widget.note.restSeconds}";
      _roundController.text = "${widget.note.rounds}";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _appBar(),
              _body(),
            ],
          ),
        ),
      ),
    );
  }

  _appBar() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyIconButton(
            onTap: () {
              _validateInput();
            },
            txt: widget.isUpdate ? "آپدیت" : "ذخیره",
          ),
          MyIconButton(
            onTap: () {
              Get.back();
            },
            icon: Icons.keyboard_arrow_left,
          ),
        ],
      ),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _titleTextController,
              style: titleTextStyle,
              cursorColor: Colors.white,
              maxLines: 1,
              maxLength: 20,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                counterText: "",
                hintText: "عنوان",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 28,
                  fontFamily: 'Shabnam',
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: bgColor),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: bgColor),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            Center(
              child: Text(
                'فعالیت',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey, fontSize: 28, fontFamily: 'Shabnam'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 150,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _activitySecondsController,
                    style: titleTextStyle,
                    cursorColor: Colors.white,
                    maxLines: 1,
                    maxLength: 2,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: "ثانیه",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 28,
                        fontFamily: 'Shabnam',
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: bgColor),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: bgColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Container(
                  width: 150,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _activityMinutesController,
                    style: titleTextStyle,
                    cursorColor: Colors.white,
                    maxLines: 1,
                    maxLength: 2,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: "دقیقه",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 28,
                        fontFamily: 'Shabnam',
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: bgColor),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: bgColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            Center(
              child: Text(
                'استراحت',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey, fontSize: 28, fontFamily: 'Shabnam'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 150,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _restSecondsController,
                    style: titleTextStyle,
                    cursorColor: Colors.white,
                    maxLines: 1,
                    maxLength: 2,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: "ثانیه",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 28,
                        fontFamily: 'Shabnam',
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: bgColor),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: bgColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Container(
                  width: 150,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _restMinutesController,
                    style: titleTextStyle,
                    cursorColor: Colors.white,
                    maxLines: 1,
                    maxLength: 2,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: "دقیقه",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 28,
                        fontFamily: 'Shabnam',
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: bgColor),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: bgColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            Center(
              child: Text(
                'دور',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey, fontSize: 28, fontFamily: 'Shabnam'),
              ),
            ),
            Center(
              child: Container(
                width: 150,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _roundController,
                  style: titleTextStyle,
                  cursorColor: Colors.white,
                  maxLines: 1,
                  maxLength: 2,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    counterText: "",
                    hintText: "دور",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 28,
                      fontFamily: 'Shabnam',
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: bgColor),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: bgColor),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
          ],
        ),
      ),
    );
  }

  _validateInput() async {
    bool isNotEmpty = _titleTextController.text.isNotEmpty &&
        (_activityMinutesController.text.isNotEmpty ||
            _activitySecondsController.text.isNotEmpty) &&
        (_restMinutesController.text.isNotEmpty ||
            _restSecondsController.text.isNotEmpty) &&
        _roundController.text.isNotEmpty;
    if (isNotEmpty && !widget.isUpdate) {
      _addNoteToDB();
      Get.back();
    } else if (widget.isUpdate &&
            _titleTextController.text != widget.note.title ||
        // ignore: unrelated_type_equality_checks
        _activityMinutesController.text !=
            widget.note.activityMinutes.toString() ||
        // ignore: unrelated_type_equality_checks
        _activitySecondsController.text !=
            widget.note.activitySeconds.toString() ||
        // ignore: unrelated_type_equality_checks
        _restMinutesController.text != widget.note.restMinutes.toString() ||
        // ignore: unrelated_type_equality_checks
        _restSecondsController.text != widget.note.restSeconds.toString() ||
        // ignore: unrelated_type_equality_checks
        _roundController.text != widget.note.rounds.toString()) {
      _updateNote();
      Get.offAll(() => NotePage());
    } else {
      Get.snackbar(
        widget.isUpdate ? "Not Updated" : "Required*",
        widget.isUpdate
            ? "Fields are not updated yet."
            : "All fields are required.",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
      );
    }
  }

  _addNoteToDB() async {
    await _noteController.addNote(
      note: Note(
        title: _titleTextController.text,
        date: DateFormat.yMMMd().format(_currentDate).toString(),
        // ignore: deprecated_member_use
        activityMinutes:
            int.parse(_activityMinutesController.text, onError: (source) => 0),
        // ignore: deprecated_member_use
        activitySeconds:
            int.parse(_activitySecondsController.text, onError: (source) => 0),
        // ignore: deprecated_member_use
        restMinutes:
            int.parse(_restMinutesController.text, onError: (source) => 0),
        // ignore: deprecated_member_use
        restSeconds:
            int.parse(_restSecondsController.text, onError: (source) => 0),
        // ignore: deprecated_member_use
        rounds: int.parse(_roundController.text, onError: (source) => 0),
      ),
    );
  }

  _updateNote() async {
    await _noteController.updateNote(
      note: Note(
        id: widget.note.id,
        title: _titleTextController.text,
        date: DateFormat.yMMMd().format(_currentDate).toString(),
        // ignore: deprecated_member_use
        activityMinutes:
            int.parse(_activityMinutesController.text, onError: (source) => 0),
        // ignore: deprecated_member_use
        activitySeconds:
            int.parse(_activitySecondsController.text, onError: (source) => 0),
        // ignore: deprecated_member_use
        restMinutes:
            int.parse(_restMinutesController.text, onError: (source) => 0),
        // ignore: deprecated_member_use
        restSeconds:
            int.parse(_restSecondsController.text, onError: (source) => 0),
        // ignore: deprecated_member_use
        rounds: int.parse(_roundController.text, onError: (source) => 0),
      ),
    );
  }
}
