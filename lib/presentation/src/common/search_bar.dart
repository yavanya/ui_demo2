
import 'package:barbers_demo/constant/colors.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 50, bottom: 29),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(42),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withAlpha(20),
                  offset: Offset(0, 6),
                ),
              ],
            ),
            width: 308,
            height: 47,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 24),
                  width: 24,
                  height: 24,
                  child: Image.asset('assets/images/icons/search.png'),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Найти',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      letterSpacing: 0.02,
                      color: MyColors.searchStringColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
