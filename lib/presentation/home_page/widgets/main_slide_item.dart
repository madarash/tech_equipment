import 'package:flutter/material.dart';

class SlideItem extends StatelessWidget {
  final List<Widget> items;
  const SlideItem({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: AlignmentDirectional.center,
      children: items,
    );
  }
}
