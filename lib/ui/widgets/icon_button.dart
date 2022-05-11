import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final IconData icon;
  final Function onTap;
  final String txt;

  MyIconButton({Key key, this.icon, this.onTap, this.txt = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 44,
          width: icon != null ? 44 : 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xFF3B3B3B),
          ),
          child: Center(
              child: icon != null
                  ? Icon(icon, color: Colors.white)
                  : Text(
                      txt,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Shabnam',
                      ),
                    )),
        ));
  }
}
