import 'package:flutter/material.dart';

class DetailsImage extends StatelessWidget {
  const DetailsImage(this.image, {super.key});

  final Widget image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 176,
      height: 176,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipOval(
        child: image,
      ),
    );
  }
}
