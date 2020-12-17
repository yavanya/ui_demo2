part of home_screen;

class _Title extends StatelessWidget {
  const _Title({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: RepaintBoundary(
          child: Padding(
            padding: const EdgeInsets.only(left: 52.0),
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.4,
                color: MyColors.mainColor,
              ),
            ),
          ),
        ),
      );
}
