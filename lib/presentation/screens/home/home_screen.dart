library home_screen;

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:stacked/stacked.dart';

import '../../screens/home/home_viewmodel.dart';
import '../../../constant/colors.dart';
import '../../../domain/model/barber.dart';
import '../../src/common/bottom_nav_bar.dart';
import '../../src/common/search_bar.dart';
import '../../src/common/new_label.dart';
import '../barber/barber_screen.dart';


part '../../src/home/first_cart.dart';

part '../../src/home/second_cart.dart';

part '../../src/home/title.dart';

part '../../src/home/vertical_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: MyColors.bgColor,
        bottomNavigationBar: BottomNavBar(),
        body: ViewModelBuilder.reactive(
          viewModelBuilder: () => HomeViewModel(),
          builder: (context, model, child) {
            if (model.isBusy) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const CustomScrollView( 
                slivers: [
                  SearchBar(),
                  _IndividualListView(),
                  _SalonsListView(),
                  SliverGap(32),
                  _BottomWidget()
                ],
              );
            }
          },
        ),
      );
}

class _IndividualListView extends ViewModelWidget<HomeViewModel> {
  const _IndividualListView({
    Key key,
  }) : super(
          key: key,
          reactive: true,
        );

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) =>
      SliverToBoxAdapter(
        child: SizedBox(
          height: 245,
          width: double.infinity,
          child: _topListView(
            viewModel.individuals,
            context,
            'ИНДИВИДУАЛЬНЫЕ МАСТЕРА',
          ),
        ),
      );
}

class _SalonsListView extends ViewModelWidget<HomeViewModel> {
  const _SalonsListView({Key key})
      : super(
          key: key,
          reactive: true,
        );

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) =>
      SliverToBoxAdapter(
        child: SizedBox(
          height: 245,
          width: double.infinity,
          child: _topListView(
            viewModel.salons,
            context,
            'BEAUTY SALONS',
          ),
        ),
      );
}

class _BottomWidget extends ViewModelWidget<HomeViewModel> {
  const _BottomWidget({Key key})
      : super(
          key: key,
          reactive: true,
        );

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) => SliverStack(
        children: [
          SliverPositioned.fill(
            child: Container(
              width: double.infinity,
              height: 740,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(52),
                ),
              ),
            ),
          ),
          MultiSliver(
            children: const [
              SliverGap(40),
              _Title(title: 'ПОСЛЕДНИЕ ПРОСМОТРЫ'),
              SliverGap(32),
              _RecentListView(),
              _Title(title: 'ПОПУЛЯРНОЕ'),
              SliverGap(32),
              _PopularListView()
            ],
          )
        ],
      );
}

class _RecentListView extends ViewModelWidget<HomeViewModel> {
  const _RecentListView({Key key})
      : super(
          key: key,
          reactive: true,
        );

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) =>
      SliverToBoxAdapter(
        child: _bottomListView(viewModel.recent, context),
      );
}

class _PopularListView extends ViewModelWidget<HomeViewModel> {
  const _PopularListView({Key key})
      : super(
          key: key,
          reactive: true,
        );

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) =>
      SliverToBoxAdapter(
        child: _bottomListView(viewModel.popular, context),
      );
}

Widget _topListView(
  List<Barber> barbers,
  BuildContext context,
  String title,
) =>
    RepaintBoundary(
      child: ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 0.0),
        itemBuilder: (context, index) {
          if (index == 0) return _VerticalWidget(title: title);

          final item = barbers[index - 1];

          return _FirstCard(
            barber: item,
          );
        },
        itemCount: barbers.length + 1,
      ),
    );

Widget _bottomListView(
  List<Barber> barbers,
  BuildContext context,
) =>
    SizedBox(
      width: double.infinity,
      height: 280,
      child: RepaintBoundary(
        child: ListView.builder(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          itemCount: barbers.length,
          itemBuilder: (context, index) => _SecondCard(
            isFist: index == 0,
            barber: barbers[index],
          ),
        ),
      ),
    );
