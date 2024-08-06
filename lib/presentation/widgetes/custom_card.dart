import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:git_search/data/models/home_model.dart';
import 'package:git_search/presentation/resurces/app_strings.dart';

class CustomCard extends StatelessWidget {
  final HomeModel item;
  final int index;
  final VoidCallback onTap;

  const CustomCard(
      {Key? key, required this.item, required this.index, required this.onTap})
      : super(key: key);

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
            item.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1A1A1A),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        trailing: InkWell(
          onTap: onTap,
          child: item.isFavorite
              ? SvgPicture.asset(AppStrings.isNotFavoriteStar)
              : SvgPicture.asset(AppStrings.isFavoriteStar),
        ),
      ),
    );
  }
}
