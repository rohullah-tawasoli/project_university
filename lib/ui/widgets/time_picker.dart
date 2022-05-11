import 'package:flutter/material.dart';
import 'package:flutter_note_app/core/controllers/timer_controller.dart';
import 'package:flutter_note_app/ui/styles/theme_data.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:get/get.dart';

// ویجت و قالب کلی تایمر ( فعالیت و استراحت ) در اپ
class TimePicker extends StatelessWidget {
  final _timerController = Get.put(TimerController());
  final String title;
  final int minutes;
  final int seconds;
  final Function onChangeCallBack;

  TimePicker(
      {Key key,
      @required this.title,
      @required this.minutes,
      @required this.seconds,
      @required this.onChangeCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Shabnam',
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.only(
            right: 15,
            top: 15,
            bottom: 15,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(
              colors: GradientColors.hope,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            boxShadow: [
              BoxShadow(
                color: GradientColors.sky.last.withOpacity(0.4),
                blurRadius: 8,
                spreadRadius: 2,
                offset: const Offset(4, 4),
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: NumberPicker(
                      itemHeight: 35,
                      itemWidth: 50,
                      minValue: 0,
                      maxValue: 59,
                      value: seconds,
                      textStyle: const TextStyle(color: Colors.grey),
                      selectedTextStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                      onChanged: (value) => _timerController.seconds,
                    ),
                  ),
                  const Text('ثانیه',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Shabnam',
                      )),
                  Expanded(
                    child: NumberPicker(
                      itemHeight: 35,
                      itemWidth: 50,
                      minValue: 0,
                      maxValue: 120,
                      value: minutes,
                      textStyle: const TextStyle(color: Colors.grey),
                      selectedTextStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Shabnam',
                      ),
                      onChanged: (value) => _timerController.minutes,
                    ),
                  ),
                  const Text(
                    'دقیقه',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Shabnam',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
