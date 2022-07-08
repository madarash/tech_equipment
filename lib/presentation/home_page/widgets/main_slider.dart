import 'package:flutter/material.dart';

import 'widgets.dart';

class MainSlideItem extends StatelessWidget {
  const MainSlideItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 130, 147, 170).withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: PageView(
          scrollDirection: Axis.horizontal,
          children: [
            SlideItem(
              items: [
                Image.asset(
                  'assets/images/slide_images/1.jpg',
                ),
                const Positioned(
                  right: 10,
                  child: Icon(
                    size: 35,
                    Icons.arrow_forward,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
            SlideItem(
              items: [
                Image.asset(
                  'assets/images/slide_images/2.jpg',
                ),
                const Positioned(
                  left: 10,
                  child: Icon(
                    size: 35,
                    Icons.arrow_back,
                    color: Colors.amber,
                  ),
                ),
                const Positioned(
                  right: 10,
                  child: Icon(
                    size: 35,
                    Icons.arrow_forward,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
            SlideItem(
              items: [
                Image.asset(
                  'assets/images/slide_images/3.jpg',
                ),
                const Positioned(
                  left: 10,
                  child: Icon(
                    size: 35,
                    Icons.arrow_back,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
