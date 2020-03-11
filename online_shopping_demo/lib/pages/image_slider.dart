import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  List<dynamic> imagesList;
  ImageSlider({@required this.imagesList});
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imagesList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Container(
                  child: FittedBox(
                    child: Image.network(i),
                    fit: BoxFit.fill,
                  ),
                ));
          },
        );
      }).toList(),
      height: 170,
      aspectRatio: 16 / 6,
      viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      pauseAutoPlayOnTouch: Duration(seconds: 10),
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
    );
  }
}
