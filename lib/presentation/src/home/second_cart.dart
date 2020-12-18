part of home_screen;

class _SecondCard extends StatelessWidget {
  const _SecondCard({
    Key key,
    @required this.isFist,
    @required this.barber,
  }) : super(key: key);

  final bool isFist;
  final Barber barber;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Get.to(BarberScreen(barber: barber)),
        child: Container(
          margin: EdgeInsets.only(left: isFist ? 52 : 0, right: 23, bottom: 25),
          width: 226,
          height: 264,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 12,
                color: Colors.black.withOpacity(0.1),
                offset: Offset(2, 2),
              ),
            ],
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(24),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                child: Image.asset('assets/images/photos${barber.mainImage}'),
              ),
              const Gap(8),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  barber.name,
                  style: const TextStyle(
                    fontFamily: 'Gilroy',
                    color: MyColors.mainColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    letterSpacing: 0.36,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  barber.address,
                  style: const TextStyle(
                    fontFamily: 'Gilroy',
                    color: MyColors.mainColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    letterSpacing: 0.24,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25, top: 8.0),
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
                        style: const TextStyle(
                          fontFamily: 'Gilroy',
                          color: MyColors.mainColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          letterSpacing: 0.24,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          barber.ratingString,
                          style: const TextStyle(
                            fontFamily: 'Gilroy',
                            color: MyColors.mainColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            letterSpacing: 0.24,
                          ),
                        ),
                      ),
                    ),
                    if (barber.isNew) NewLabel() else const SizedBox()
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
