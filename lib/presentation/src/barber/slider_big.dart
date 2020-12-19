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
  List<Image> _images = [];

  @override
  void initState() {
    super.initState();
    _sliderIndex = 0;
    widget.barber.images.forEach((e) {
      _images.add(
        Image.asset(
          'assets/images/photos/$e',
        ),
      );
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _images.forEach((e) {
      precacheImage(e.image, context);
    });
  }

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              GestureDetector(
                onTap: () => setState(() {
                  if (_sliderIndex < _images.length - 1)
                    _sliderIndex++;
                  else
                    _sliderIndex = 0;
                }),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: _images[_sliderIndex],
                ),
              ),
              Positioned(
                bottom: 20,
                child: Row(
                  children: List.generate(_images.length, (i) {
                    int _curIndex;
                    _curIndex = i;
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      width: 33,
                      height: _sliderIndex == _curIndex ? 4 : 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      );
}
