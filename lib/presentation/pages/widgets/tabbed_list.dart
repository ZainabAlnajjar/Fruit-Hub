
import 'package:flutter/material.dart';

import '../../../util/colors.dart';

class TabbedList<T> extends StatelessWidget {
  final List<String> titles;
  final List<List<T>> lists;
  final Widget Function(T item) itemBuilder;

  const TabbedList({
    super.key,
    required this.titles,
    required this.lists,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: titles.length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
            child: TabBar(
              labelColor: Color(FruitColor.navyBlueColor),
              labelStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              unselectedLabelColor: Color(FruitColor.unselectedTabColor),
              unselectedLabelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              indicatorColor: Color(FruitColor.orangeColor),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerHeight: 0,
              tabAlignment: TabAlignment.start,

              isScrollable: true,
              tabs: titles.map((title) => Tab(text: title)).toList(),
              indicator: StartAlignedUnderlineIndicator(
                width: 22,
                height: 2,
                color: Color(FruitColor.orangeColor),
              ),
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
          SizedBox(
            height: 220,
            child: TabBarView(
              children: lists.map((list) {
                return ListView.builder(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  itemCount: list.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: itemBuilder(list[index]),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class StartAlignedUnderlineIndicator extends Decoration {
  final double width;
  final double height;
  final Color color;

  const StartAlignedUnderlineIndicator({
    required this.width,
    this.height = 3,
    required this.color,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _StartUnderlinePainter(width: width, height: height, color: color);
  }
}

class _StartUnderlinePainter extends BoxPainter {
  final double width;
  final double height;
  final Color color;

  _StartUnderlinePainter({
    required this.width,
    required this.height,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration config) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final Rect rect = Rect.fromLTWH(
      offset.dx,
      offset.dy + config.size!.height - height,
      width,
      height,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, const Radius.circular(2)),
      paint,
    );
  }
}