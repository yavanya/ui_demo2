import 'package:flutter/material.dart';
import '../../src/common/new_label.dart';
import '../../../constant/text_styles.dart';
import '../../../domain/model/barber.dart';

class SmallInfoWidget extends StatelessWidget {
  const SmallInfoWidget({
    Key key,
    @required this.barber,
  }) : super(key: key);

  final Barber barber;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 31.0),
        child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        barber.name,
        style: Styles.h1,
      ),
      Text(
        barber.address,
        style: Styles.h3500,
      ),
      Padding(
        padding: const EdgeInsets.only(right: 25, top: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/icons/star.png',
              width: 15,
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                barber.rating.toStringAsPrecision(2),
                style: Styles.h3500,
              ),
            ),
            //TODO ask why Flexible?
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  barber.ratingString,
                  style: Styles.h3500,
                ),
              ),
            ),
            if (barber.isNew) NewLabel() else const SizedBox()
          ],
        ),
      ),
    ],
        ),
      );
  }
}
