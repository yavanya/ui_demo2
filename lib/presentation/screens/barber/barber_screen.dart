library barber_screen;

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../constant/ratings.dart';
import '../../../constant/colors.dart';
import '../../../constant/text_styles.dart';
import '../../../domain/model/barber.dart';
import '../../src/common/custom_appbar.dart';
import '../../src/common/small_info_widget.dart';

part '../../src/barber/top_widget.dart';

part '../../src/barber/slider_big.dart';

part '../../src/barber/slider_small.dart';

part '../../src/barber/info_widget.dart';

part '../../src/barber/open_hours.dart';

part '../../src/barber/barber_services.dart';

part '../../src/barber/team_widget.dart';

part '../../src/barber/review_widget.dart';

class BarberScreen extends StatelessWidget {
  const BarberScreen({
    Key key,
    @required this.barber,
  }) : super(key: key);
  final Barber barber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      body: CustomScrollView(
        slivers: [
          _TopWidget(barber: barber),
          SliverGap(39),
          _ReviewWidget(reviews: barber.reviews),
          _AppointmentButton()
        ],
      ),
    );
  }
}

class _AppointmentButton extends StatelessWidget {
  const _AppointmentButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(top: 27.0, bottom: 28, left: 90, right: 90),
        height: 52,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32), color: MyColors.mainColor),
        child: Center(
          child: Text(
            'ЗАПИСАТЬСЯ',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.32),
          ),
        ),
      ),
    );
  }
}
