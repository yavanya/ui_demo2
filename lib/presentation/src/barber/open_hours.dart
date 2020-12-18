part of barber_screen;

class _OpenHours extends StatefulWidget {
  _OpenHours(
      {@required this.isOpen,
      @required this.openTime,
      @required this.closeTime,
      Key key})
      : super(key: key);
  final bool isOpen;
  final TimeOfDay openTime;
  final TimeOfDay closeTime;

  @override
  _OpenHoursState createState() => _OpenHoursState();
}

class _OpenHoursState extends State<_OpenHours> {
  bool _isDropped;

  @override
  void initState() {
    _isDropped = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _isDropped = !_isDropped),
      child: Container(
          width: 192,
          height: _isDropped ? 112 : 28,
          decoration: BoxDecoration(
            color: MyColors.mainColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
      Container(
        height: 12,
        padding: const EdgeInsets.only(left: 10.0),
        child: Image.asset('assets/images/icons/clock.png'),
      ),
      if (widget.isOpen)
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text('Открыто', style: Styles.h5700white),
        )
      else
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text('Закрыто', style: Styles.h5700white),
        ),
      if (widget.isOpen)
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text(
              '${widget.openTime.hour}:00 - ${widget.closeTime.hour}:00',
              style: Styles.h5700white),
        ),
      Spacer(),
      Container(
        width: 10,
        height: 10,
        margin: const EdgeInsets.only(right: 10.0),
        child: Image.asset(
          _isDropped
              ? 'assets/images/icons/chevron_up.png'
              : 'assets/images/icons/chevron_down.png',
        ),
      ),
            ],
          ),
        ),
    );
  }
}
