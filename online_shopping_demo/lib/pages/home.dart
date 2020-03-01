import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_shopping_demo/pages/image_slider.dart';
import 'dart:async' show Future;
import 'dart:convert' as convert;
import 'package:flutter/services.dart' show rootBundle;

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
      future: rootBundle.loadString('assets/config.json'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var categoryList =
              convert.jsonDecode(snapshot.data)['homePage']['categories'];

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                ImageSlider(),
                Column(
                  children: categoryList.map<Widget>((category) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                category['tilte'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 120.0,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children:
                                      category['imageUrls'].map<Widget>((i) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: FittedBox(
                                                  fit: BoxFit.fill,
                                                  child: Image.network(i)),
                                            ));
                                      },
                                    );
                                  }).toList(),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    ));
  }
}
