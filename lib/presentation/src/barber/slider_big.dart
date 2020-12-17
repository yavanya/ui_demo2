part of barber_screen;

// as i did not have detailed info about the slider, i did like this:
class _SliderWidget extends StatefulWidget {
  _SliderWidget({@required this.barber, Key key}) : super(key: key);
  final Barber barber;
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<_SliderWidget> {
  int _sliderIndex;

  @override
  void initState() {
    _sliderIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (_sliderIndex < widget.barber.images.length - 1) {
                  _sliderIndex++;
                } else {
                  _sliderIndex = 0;
                }
              });
            },
            child: Container(
              width: double.infinity,
              height: 222,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/photos${widget.barber.images[_sliderIndex]}'), fit: BoxFit.fitWidth
                ),
              ),
              margin: const EdgeInsets.only(left: 24, right: 24),
            ),
          ),
          Positioned(
            bottom: 20,
            child: Row(
              children: List.generate(widget.barber.images.length, (i) {
                int _curIndex;
                _curIndex = i;
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 33,
                  height: _sliderIndex == _curIndex ? 4 : 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
