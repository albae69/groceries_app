import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      child: FlutterCarousel(
        options: CarouselOptions(
          showIndicator: true,
          height: 115,
          autoPlay: true,
          enableInfiniteScroll: true,
          aspectRatio: 16 / 9,
          reverse: false,
          floatingIndicator: true,
        ),
        items: [1, 2, 3]
            .map((i) => Builder(builder: (BuildContext context) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Image.asset(
                      'assets/promo.png',
                      fit: BoxFit.fitHeight,
                    ),
                  );
                }))
            .toList(),
      ),
    );
  }
}
