part of home_screen;

class _VerticalWidget extends StatelessWidget {
  const _VerticalWidget({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(right: 24, bottom: 16, top: 16),
        width: 84,
        height: 245,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 18,
              color: Colors.black.withOpacity(0.12),
              offset: Offset(6, 6),
            ),
          ],
        ),
        child: RotatedBox(
          quarterTurns: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: MyColors.mainColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const Gap(2),
              Text(
                'посмотреть все',
                style: const TextStyle(
                  color: MyColors.mainColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  letterSpacing: 2.5,
                ),
              ),
            ],
          ),
        ),
      );
}
