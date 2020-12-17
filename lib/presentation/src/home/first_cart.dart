part of home_screen;

class _FirstCard extends StatelessWidget {
  const _FirstCard({
    Key key,
    @required this.barber,
  }) : super(key: key);

  final Barber barber;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Get.to(BarberScreen(barber: barber)),
        child: Container(
          margin: EdgeInsets.only(right: 24, bottom: 16, top: 16),
          width: 249,
          height: 245,
          child: DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 18,
                  color: Colors.black.withOpacity(0.12),
                  offset: Offset(6, 6),
                ),
              ],
              image: DecorationImage(
                image: AssetImage('assets/images/photos${barber.images[0]}'),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(24)),
            ),
            child: CustomPaint(
              painter: const _WavePainter(),
              child: Padding(
                padding: const EdgeInsets.only(left: 24, bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      barber.name,
                      style: const TextStyle(
                        color: MyColors.mainColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        letterSpacing: 0.36,
                      ),
                    ),
                    Text(
                      barber.address,
                      style: const TextStyle(
                        color: MyColors.mainColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        letterSpacing: 0.24,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 15,
                            height: 18,
                            child: Image.asset('assets/images/icons/star.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              barber.rating.toStringAsPrecision(2),
                              style: const TextStyle(
                                color: MyColors.mainColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                letterSpacing: 0.24,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              barber.ratingString,
                              style: const TextStyle(
                                color: MyColors.mainColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                letterSpacing: 0.24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

class _WavePainter extends CustomPainter {
  const _WavePainter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas
      ..scale(size.width / 249)
      ..translate(0, size.height - 100)
      ..drawPath(
        Path()
          ..moveTo(-1.000, 0.000)
          ..lineTo(82.920, 0.000)
          ..cubicTo(100.615, 0.000, 119.385, 4.077, 140.710, 14.384)
          ..cubicTo(165.882, 26.550, 200.870, 34.932, 216.088, 34.932)
          ..lineTo(249.254, 34.932)
          ..lineTo(249.254, 76.000)
          ..cubicTo(249.254, 89.255, 238.508, 100.000, 225.254, 100.000)
          ..lineTo(23.000, 100.000)
          ..cubicTo(9.745, 100.000, -1.000, 89.255, -1.000, 76.000)
          ..lineTo(-1.000, 0.000)
          ..close(),
        Paint()..color = Colors.white,
      );
  }

  @override
  bool shouldRepaint(_WavePainter oldDelegate) => false;
}
