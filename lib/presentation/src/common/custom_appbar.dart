
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/text_styles.dart';
import '../../../constant/colors.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;
  CustomAppBar({@required this.title, Key key})
      : preferredSize = Size.fromHeight(50),
        super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _isFavorite;

  @override
  void initState() {
    _isFavorite = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        widget.title,
        style: Styles.h2,
      ),
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: GestureDetector(
          child: Icon(
            Icons.chevron_left_rounded,
            color: MyColors.mainColor,
            size: 38,
          ),
          onTap: () => Get.back(canPop: true),
        ),
      ),
      elevation: 5.0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 35.0),
          child: GestureDetector(
            child: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: MyColors.mainColor,
              size: 28,
            ),
            onTap: () => setState(() => _isFavorite = !_isFavorite),
          ),
        ),
      ],
      floating: true,
      centerTitle: true,
    );
  }
}
