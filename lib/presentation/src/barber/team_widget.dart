part of barber_screen;

class _TeamWidget extends StatelessWidget {
  _TeamWidget({@required this.team, Key key}) : super(key: key);
  final List<Team> team;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: RepaintBoundary(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Padding(
            padding: const EdgeInsets.only(left: 52.0),
            child: Text(
              'Команда',
              style: Styles.h2,
            ),
          ),
          SizedBox(
            height: 271,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: team.length,
              itemBuilder: (context, index) => _TeamCard(
                member: team[index],
                i: index,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class _TeamCard extends StatelessWidget {
  _TeamCard({@required this.member, @required this.i, Key key})
      : super(key: key);
  final Team member;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          right: 20.0, top: 26, bottom: 29.0, left: i == 0 ? 52 : 0),
      width: 133,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          //TODO check shadows
          BoxShadow(
            blurRadius: 18,
            color: Colors.black.withOpacity(0.12),
            offset: Offset(6, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              'assets/images/photos${member.image}',
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(member.name, style: Styles.h4500),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: MyColors.mainColor),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
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
          )
        ],
      ),
    );
  }
}
