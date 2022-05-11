import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_note_app/ui/widgets/round_button.dart';

// صفحه برای شروع و نمایش تایمر
class TimerPage extends StatefulWidget {
  // متغیری برای نگه داشتن مقدار فعالیت
  final int activityTime;
  // متغیری برای نگه داشتن مقدار استراحت
  final int restTime;
  // متغیری برای نگه داشتن دور
  final int rounds;

  // کانستراکتور برای گرفتن مقدار بالا از صفحه قبلی
  const TimerPage({
    Key key,
    // ست کردن مقدار فعالیت
    @required this.activityTime,
    // ست کردن مقدار استراحت
    @required this.restTime,
    // ست کردن تعداد دور
    @required this.rounds,
  }) : super(key: key);

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  // متغیری از نوع تایمر برای شمارش ثانیه های که گذشته است
  Timer _timer;
  // متغیری برای نمایش متن " فعالیت "
  String _currentPeriod = 'فعالیت';
  // متغیری برای گرفتن مقدار فعالیت
  int _timeLeft;
  // متغیری برای تعداد دور های کامل شده
  double _roundsCompleted = 0.0;
  // فلگی برای شروع
  bool _timing = false;

  @override
  void initState() {
    super.initState();
    _timeLeft = widget.activityTime;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  // تابعی برای شروع تایمر
  void _startCountDown() {
    // شمارش معکوس در حالی که سوئیچینگ بین فعالیت و زمان استراحت
    // برای تنظیم تعداد دور
    setState(() {
      _timing = true;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        setState(() {
          _roundsCompleted += 0.5;
        });
        if (_currentPeriod == 'فعالیت' && _roundsCompleted < widget.rounds) {
          setState(() {
            _timeLeft = widget.restTime;
            _currentPeriod = 'استراحت';
          });
        } else if (_currentPeriod == 'استراحت' &&
            _roundsCompleted < widget.rounds) {
          setState(() {
            _timeLeft = widget.activityTime;
            _currentPeriod = 'فعالیت';
          });
        } else {
          _timer.cancel();
        }
      }
    });
  }

  // تابعی برای مکث تایمر
  void _pauseCountDown() {
    setState(() {
      _timing = false;
      _timer.cancel();
    });
  }

  // تابعی استارت دوباره تایمر از اول
  void _resetCountDown() {
    setState(() {
      _timeLeft = widget.activityTime;
      _currentPeriod = 'فعالیت';
      _roundsCompleted = 0.0;
      _timing = false;
    });
  }

  // تابعی برای ساختن و نمایش یوآی صفحه
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _currentPeriod == 'فعالیت'
          ? const Color(0xFF008CC8)
          : const Color(0xFF0B4971),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(_currentPeriod,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Shabnam',
                )),
            (_timeLeft == 0) && (_roundsCompleted == widget.rounds)
                // نمایش متن " پایان " وقتی که تایمر تمام شود
                ? const Text('پایان',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 90,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Shabnam',
                    ))
                // نمایش تایمر وقتی تایمر هنوز تمام نشده است
                : Text(
                    '${(_timeLeft ~/ 60)}'.padLeft(2, '0') +
                        ':' +
                        '${_timeLeft % 60}'.padLeft(2, '0'),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 90,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Shabnam',
                    )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                (_timeLeft == 0) && (_roundsCompleted == widget.rounds)
                    // نمایش دکمه استراحت وقتی تایمر تمام می شود
                    ? RoundButton(
                        text: 'استراحت',
                        onPressedCallBack: _resetCountDown,
                      )
                    : _timing
                        // نمایش دکمه توقف وقتی تایمر در حال اجراست
                        ? RoundButton(
                            text: 'توقف',
                            onPressedCallBack: _pauseCountDown,
                          )
                        // نمایش دکمه شروع وقتی تایمر در حال اجرا نیست
                        : RoundButton(
                            text: 'شروع',
                            onPressedCallBack: _startCountDown,
                          ),
                // نمایش دکمه انصراف وقتی تایمر هنوز شروع نشده است
                RoundButton(
                  text: 'انصراف',
                  onPressedCallBack: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
