import 'package:flutter/material.dart';

import '../../../util/colors.dart';

class ListSection<T> extends StatelessWidget {
  final String title;
  final List<T> list;
  final Widget Function(T item) itemBuilder;

  const ListSection({
    super.key,
    required this.title,
    required this.list,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: FruitColor.navyBlueColor,
            ),
          ),
        ),

        SizedBox(
          height: 185,
          child: ListView.builder(
            clipBehavior: Clip.none,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) => itemBuilder(list[index]),
          ),
        ),
      ],
    );
  }
}

