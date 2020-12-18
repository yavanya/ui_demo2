part of barber_screen;

// as i did not have detailed info about the slider, i did like this:
class _SliderSmall extends StatefulWidget {
  _SliderSmall({@required this.service, Key key}) : super(key: key);
  final Service service;
  @override
  _SliderSmallState createState() => _SliderSmallState();
}

class _SliderSmallState extends State<_SliderSmall> {
  int _sliderIndex;

  @override
  void initState() {
    _sliderIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if (_sliderIndex < widget.service.images.length - 1) {
                _sliderIndex++;
              } else {
                _sliderIndex = 0;
              }
            });
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              width: double.infinity,
              height: 146,
              child: Image.asset(
                'assets/images/photos/${widget.service.images[_sliderIndex]}',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          child: Row(
            children: List.generate(widget.service.images.length, (i) {
              int _curIndex;
              _curIndex = i;
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: 18,
                height: _sliderIndex == _curIndex ? 1.7 : 0.85,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
              );
            }),
          ),
        ),
      ],
    );
  }
}
