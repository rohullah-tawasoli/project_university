import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_note_app/ui/pages/timer_page.dart';
import 'package:get/get.dart';

// صفحه برای انتخاب مدت فعالیت،استراحت و تعداد دور
class HomePage extends StatelessWidget {
  final _activityMinutesController = TextEditingController();
  final _activitySecondsController = TextEditingController();
  final _restMinutesController = TextEditingController();
  final _restSecondsController = TextEditingController();
  final _roundController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF252525),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // ویجتی برای نمایش متن " تایمر "
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: const Text(
                  'تایمر',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                    fontFamily: 'Shabnam',
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'فعالیت',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      fontFamily: 'Shabnam',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 100,
                        padding: EdgeInsets.all(5.0),
                        child: TextField(
                          controller: _activitySecondsController,
                          textInputAction: TextInputAction.next,
                          maxLength: 2,
                          keyboardType: TextInputType.number,
                          autocorrect: true,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            counterText: "",
                            hintText: 'ثانیه',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontFamily: 'Shabnam',
                            ),
                            filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade800, width: 2),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        padding: EdgeInsets.all(5.0),
                        child: TextField(
                          controller: _activityMinutesController,
                          textInputAction: TextInputAction.next,
                          maxLength: 2,
                          keyboardType: TextInputType.number,
                          autocorrect: true,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            counterText: "",
                            hintText: 'دقیقه',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontFamily: 'Shabnam',
                            ),
                            filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade800, width: 2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'استراحت',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      fontFamily: 'Shabnam',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 100,
                        padding: EdgeInsets.all(5.0),
                        child: TextField(
                          controller: _restSecondsController,
                          textInputAction: TextInputAction.next,
                          maxLength: 2,
                          keyboardType: TextInputType.number,
                          autocorrect: true,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            counterText: "",
                            hintText: 'ثانیه',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontFamily: 'Shabnam',
                            ),
                            filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade800, width: 2),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        padding: EdgeInsets.all(5.0),
                        child: TextField(
                          controller: _restMinutesController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          maxLength: 2,
                          autocorrect: true,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            counterText: "",
                            hintText: 'دقیقه',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontFamily: 'Shabnam',
                            ),
                            filled: true,
                            fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade800, width: 2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'دور',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      fontFamily: 'Shabnam',
                    ),
                  ),
                  Container(
                    width: 100,
                    padding: EdgeInsets.all(5.0),
                    child: TextField(
                      controller: _roundController,
                      inputFormatters: <TextInputFormatter>[
                        // ignore: deprecated_member_use
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      textInputAction: TextInputAction.done,
                      maxLength: 2,
                      keyboardType: TextInputType.number,
                      autocorrect: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        counterText: "",
                        hintText: 'دور',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontFamily: 'Shabnam',
                        ),
                        filled: true,
                        fillColor: Colors.white70,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: Colors.grey.shade800, width: 2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 70),
                child: GestureDetector(
                  onTap: () {
                    int activityTimeMinutes =
                        int.parse(_activityMinutesController.text,
                            // ignore: deprecated_member_use
                            onError: (source) => 0);
                    if (activityTimeMinutes == null) {
                      activityTimeMinutes = 0;
                    }

                    int activityTimeSeconds =
                        int.parse(_activitySecondsController.text,
                            // ignore: deprecated_member_use
                            onError: (source) => 0);
                    if (activityTimeSeconds == null) {
                      activityTimeSeconds = 0;
                    }

                    int restTimeMinutes = int.parse(_restMinutesController.text,
                        // ignore: deprecated_member_use
                        onError: (source) => 0);
                    if (restTimeMinutes == null) {
                      restTimeMinutes = 0;
                    }

                    int restTimeSeconds = int.parse(_restSecondsController.text,
                        // ignore: deprecated_member_use
                        onError: (source) => 0);
                    if (restTimeSeconds == null) {
                      restTimeSeconds = 0;
                    }

                    int rounds = int.parse(_roundController.text,
                        // ignore: deprecated_member_use
                        onError: (source) => 0);
                    if (rounds == null) {
                      rounds = 0;
                    }
                    int activityTime =
                        (activityTimeMinutes * 60) + activityTimeSeconds;
                    int restTime = (restTimeMinutes * 60) + restTimeSeconds;
                    print('activity Time Minutes : $activityTimeMinutes');
                    Get.to(
                      TimerPage(
                          activityTime: activityTime,
                          restTime: restTime,
                          rounds: rounds),
                      transition: Transition.downToUp,
                    );
                  },
                  child: Container(
                    width: 100,
                    height: 80,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.teal,
                          Colors.teal[200],
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(5, 5),
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'شروع',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Shabnam',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
