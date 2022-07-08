import 'package:flutter/material.dart';

class SubTitle extends StatelessWidget {
  final String subTitle;
  const SubTitle({
    required this.subTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        'Sound equipment'.toUpperCase(),
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
