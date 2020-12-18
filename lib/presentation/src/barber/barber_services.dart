part of barber_screen;

class _BarberServices extends StatelessWidget {
  _BarberServices({@required this.services, Key key}) : super(key: key);
  final List<Service> services;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            'Услуги',
            style: Styles.h2,
          ),
        ),
        ListView.builder(
          padding: const EdgeInsets.all(0),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: services.length + 1,
          itemBuilder: (context, index) => _ServiceCard(
            services: services,
            index: index,
          ),
        ),
      ]),
    );
  }
}

class _ServiceCard extends StatefulWidget {
  _ServiceCard({@required this.services, @required this.index, Key key})
      : super(key: key);
  final List<Service> services;
  final int index;

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _isDropped;

  @override
  void initState() {
    if (widget.index == 0) {
      _isDropped = true;
    } else {
      _isDropped = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Service _serviceCard;
    //TODO looks bad
    _serviceCard = widget.services[widget.index > widget.services.length - 1
        ? widget.services.length - 1
        : widget.index];

    return Container(
      margin: EdgeInsets.only(
        right: 25,
        bottom: widget.index == widget.services.length ? 28 : 10.0,
      ),
      decoration: BoxDecoration(
        color: MyColors.bgColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: widget.index == widget.services.length
          ? Padding(
              padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
              child: Center(
                child: Text('ВСЕ УСЛУГИ', style: Styles.h3700),
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_isDropped)
                  _SliderSmall(
                    service: _serviceCard,
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 25.0,
                            right: 8.0,
                          ),
                          child: Text(
                            _serviceCard.name,
                            style: Styles.h3700,
                          ),
                        ),
                        if (!_isDropped)
                          GestureDetector(
                            child: SizedBox(
                              width: 10,
                              height: 10,
                              child: Center(
                                child: Image.asset(
                                  'assets/images/icons/chevron_down.png',
                                ),
                              ),
                            ),
                            onTap: () =>
                                setState(() => _isDropped = !_isDropped),
                          ),
                      ]),
                ),
                if (_isDropped)
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25.0,
                      right: 25.0,
                      top: 11.0,
                      bottom: 50,
                    ),
                    child: Text(
                      _serviceCard.description,
                      style: Styles.h4500,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, bottom: 18.0),
                  child: Row(children: [
                    Text(
                      '${_serviceCard.durationMin} - ${_serviceCard.durationMax}',
                      style: Styles.h4500,
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: Text(
                        '${_serviceCard.price}',
                        style: Styles.h4700,
                      ),
                    ),
                  ]),
                ),
              ],
            ),
    );
  }
}
