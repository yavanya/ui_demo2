part of barber_screen;

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
    double _width = MediaQuery.of(context).size.width;
    return SliverToBoxAdapter(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // as i did not have detailed info about the slider, i did like this:
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                width: _width * 0.9,
                height: _width * 0.5,
                child: Image.asset(
                  'assets/images/photos${widget.barber.images[_sliderIndex]}',
                  fit: BoxFit.fitWidth,
                ),
              ),
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
