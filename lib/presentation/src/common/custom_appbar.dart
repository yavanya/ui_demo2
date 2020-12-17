
import 'package:barbers_demo/constant/colors.dart';
import 'package:barbers_demo/constant/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      leading: IconButton(
        icon: Icon(
          Icons.chevron_left_rounded,
          color: MyColors.mainColor,
          size: 38,
        ),
        onPressed: () => Get.back(canPop: true),
      ),
      elevation: 5.0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: MyColors.mainColor,
              size: 28,
            ),
            onPressed: () => setState(() => _isFavorite = !_isFavorite),
          ),
        ),
      ],
      floating: true,
      centerTitle: true,
    );
  }
}
