part of barber_screen;

class _ReviewWidget extends StatelessWidget {
  _ReviewWidget({@required this.reviews, Key key}) : super(key: key);
  final List<Review> reviews;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 500,
        width: double.infinity,
        child: RepaintBoundary(
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: reviews.length + 1,
            itemBuilder: (context, index) => _ReviewCard(
              reviews: reviews,
              i: index,
            ),
          ),
        ),
      ),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  _ReviewCard({@required this.reviews, @required this.i, Key key})
      : super(key: key);
  final List<Review> reviews;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: i > reviews.length - 1
          ? Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Text('ВСЕ ОТЗЫВЫ', style: Styles.h3700),
              ),
            )
          : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: CircleAvatar(
                        radius: 22.5,
                        backgroundImage: AssetImage(
                            'assets/images/photos${reviews[i].avatarImage}.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: Text(reviews[i].name, style: Styles.h3700),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    reviews[i].review,
                    textAlign: TextAlign.start,
                    style: Styles.h4500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    children: [
                      Text(
                        reviews[i].date,
                        style: Styles.h4500,
                      ),
                      Spacer(),
                      Image.asset(
                        'assets/images/icons/star.png',
                        width: 15,
                        height: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          reviews[i].rating.toStringAsPrecision(2),
                          style: Styles.h4500,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 20),
                        child: Text(
                          getRatingString(reviews[i].rating),
                          style: Styles.h4500,
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
    );
  }
}
