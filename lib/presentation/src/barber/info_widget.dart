part of barber_screen;

class _InfoWidget extends StatelessWidget {
  _InfoWidget({@required this.barber, Key key}) : super(key: key);

  final Barber barber;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(left: 24, right: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              blurRadius: 12,
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(children: [
          Gap(21),
          SmallInfoWidget(barber: barber),
          Gap(20),
          _OpenHours(
              isOpen: barber.isOpen,
              openTime: barber.openTimeReal,
              closeTime: barber.closeTimeReal),
          Gap(20),
          _BarberServices(services: barber.services),
        ]),
      ),
    );
  }
}
