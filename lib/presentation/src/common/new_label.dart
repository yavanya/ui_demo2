import 'package:flutter/material.dart';
import '../../../constant/colors.dart';

class NewLabel extends StatelessWidget {
  const NewLabel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        width: 54,
        height: 13,
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
                fontSize: 9,
                letterSpacing: 0.18),
          ),
        ),
      ),
    );
  }
}
