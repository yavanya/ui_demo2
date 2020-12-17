import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 88,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 12,
              color: Colors.black.withAlpha(12),
              offset: Offset(18, 0),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 18,
              child: Image.asset('assets/images/icons/home.png'),
            ),
            SizedBox(
              width: 24,
              child: Image.asset('assets/images/icons/calendar.png'),
            ),
            SizedBox(
              width: 24,
              child: Image.asset('assets/images/icons/account.png'),
            ),
          ],
        ),
      );
}
