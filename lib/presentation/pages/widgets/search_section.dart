import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../util/assets.dart';
import '../../../util/colors.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for fruit salad combos',
                hintStyle: TextStyle(
                  color: Color(FruitColor.lightGrayColor),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: SvgPicture.asset(
                  Assets.icon.search,
                  width: 16,
                  height: 16,
                  fit: BoxFit.none,
                ),
                contentPadding: const EdgeInsets.only(
                  right: 16,
                  left: 24,
                  top: 16,
                  bottom: 16,
                ),
                filled: true,
                fillColor: Color(FruitColor.searchFieldBackgroundColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          const SizedBox(width: 16),

          SvgPicture.asset(
            Assets.icon.filter,
            width: 26,
            height: 17,
            fit: BoxFit.none,
          ),
        ],
      ),
    );
  }
}