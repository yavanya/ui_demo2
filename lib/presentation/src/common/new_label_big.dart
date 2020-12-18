import 'package:flutter/material.dart';
import '../../../constant/colors.dart';

class NewLabelBig extends StatelessWidget {
  const NewLabelBig({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        width: 74,
        height: 19,
        decoration: BoxDecoration(
          color: MyColors.newColor,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Center(
          child: const Text(
            'Новинка',
            style: TextStyle(
                fontFamily: 'Gilroy',
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 13,
                letterSpacing: 0.26),
          ),
        ),
      ),
    );
  }
}
