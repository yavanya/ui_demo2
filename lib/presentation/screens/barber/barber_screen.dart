library barber_screen;

import 'package:barbers_demo/constant/ratings.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../constant/colors.dart';
import '../../../constant/text_styles.dart';
import '../../../domain/model/barber.dart';
import '../../src/common/custom_appbar.dart';
import '../../src/common/small_info_widget.dart';

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
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 52),
              child: Text(
                'Отзывы',
                style: Styles.h2,
              ),
            ),
          ),
          _ReviewWidget(reviews: barber.reviews),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: MyColors.mainColor),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 18.0, horizontal: 90),
                child: Text(
                  'ЗАПИСАТЬСЯ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.24),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _TopWidget extends StatelessWidget {
  _TopWidget({@required this.barber, Key key})
      : super(
          key: key,
        );
  final Barber barber;

  @override
  Widget build(BuildContext context) {
    return SliverStack(children: [
      SliverPositioned.fill(
        child: Container(
          padding: const EdgeInsets.only(bottom: 20),
          width: double.infinity,
          // height: 1400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(52),
            ),
          ),
        ),
      ),
      MultiSliver(children: [
        SliverGap(20, color: Colors.white),
        CustomAppBar(title: barber.name),
        SliverGap(20),
        _SliderWidget(barber: barber),
        SliverGap(20),
        SliverToBoxAdapter(child: SmallInfoWidget(barber: barber)),
        SliverGap(20),
        _OpenHours(
            isOpen: barber.isOpen,
            openTime: barber.openTimeReal,
            closeTime: barber.closeTimeReal),
        SliverGap(20),
        SliverPadding(
          padding: EdgeInsets.only(left: 52),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Услуги',
              style: Styles.h2,
            ),
          ),
        ),
        SliverGap(10),
        _BarberServices(services: barber.services),
        SliverGap(40),
        if (barber.team.isNotEmpty)
          SliverPadding(
            padding: EdgeInsets.only(left: 52),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Команда',
                style: Styles.h2,
              ),
            ),
          ),
        if (barber.team.isNotEmpty) _TeamWidget(team: barber.team),
      ]),
    ]);
  }
}
