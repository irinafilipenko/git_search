import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants.dart';

class ItemCard extends StatelessWidget {
  String name = "";
  bool favorite;
  final Function() onPressed;

  ItemCard(
      {super.key,
      required this.name,
      required this.favorite,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: SizedBox(
          width: MediaQuery.of(context).size.width / 1.3,
          child: Text(
            name,
            style: kItemTextStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        trailing: InkWell(
          onTap: onPressed,
          child: favorite
              ? SvgPicture.asset("assets/icons/favorite.svg")
              : SvgPicture.asset("assets/icons/favorite_active.svg"),
        ),
      ),
    );
  }
}
