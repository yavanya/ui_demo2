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

  final TextStyle _style =
      TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white);

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
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(left: 54, right: 108),
        child: GestureDetector(
          onTap: () => setState(() => _isDropped = !_isDropped),
          child: Container(
            height: _isDropped ? 112 : 28,
            decoration: BoxDecoration(
              color: MyColors.mainColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Icon(Icons.alarm, size: 14, color: Colors.white),
                ),
                widget.isOpen
                    ? Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('Открыто', style: widget._style),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('Закрыто', style: widget._style),
                      ),
                if (widget.isOpen)
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                        '${widget.openTime.hour}:00 - ${widget.closeTime.hour}:00',
                        style: widget._style),
                  ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Icon(
                    _isDropped ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
