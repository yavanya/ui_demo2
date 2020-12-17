part of barber_screen;

class _TopWidget extends StatelessWidget {
  _TopWidget({@required this.barber, Key key}) : super(key: key);

  final Barber barber;

  @override
  Widget build(BuildContext context) {
    return SliverStack(children: [
      SliverPositioned.fill(
        child: Container(
          padding: const EdgeInsets.only(bottom: 20),
          width: double.infinity,
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
        _InfoWidget(barber: barber),
        SliverGap(40),
        if (barber.team.isNotEmpty) _TeamWidget(team: barber.team),
      ]),
    ]);
  }
}
