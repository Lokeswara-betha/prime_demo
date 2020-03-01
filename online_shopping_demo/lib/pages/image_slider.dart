import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        "https://live.staticflickr.com/4005/4686746190_31c292dc8c_b.jpg",
        "https://i0.wp.com/manapop.com/wp-content/uploads/2019/10/jokerposter.jpg",
        "https://agathachristieltd.imgix.net/image-store/Banner-art-7th-Sept-with-clue.jpg",
        "https://assets.fontsinuse.com/static/use-media-items/27/26619/full-1500x690/567022b0/interstellar_ver7_xlg.jpeg",
        "https://i0.wp.com/manapop.com/wp-content/uploads/2019/10/jokerposter.jpg"
      ].map((i) {
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
      height: 200,
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
