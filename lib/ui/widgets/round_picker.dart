import 'package:flutter/material.dart';
import 'package:flutter_note_app/ui/styles/theme_data.dart';

// ویجت و قالب کلی تعداد دور در اپ
class RoundPicker extends StatelessWidget {
  final int rounds;
  final Function onPressedCallBack;

  const RoundPicker({
    Key key,
    @required this.rounds,
    @required this.onPressedCallBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          'دور',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 26,
            fontFamily: 'Shabnam',
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
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
          child: Row(
            children: <Widget>[
              MaterialButton(
                child: const Text(
                  '-',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Shabnam',
                  ),
                ),
                onPressed: () => onPressedCallBack('-'),
              ),
              Text(
                rounds.toString(),
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontFamily: 'Shabnam',
                ),
              ),
              MaterialButton(
                child: const Text(
                  '+',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Shabnam',
                  ),
                ),
                onPressed: () => onPressedCallBack('+'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
