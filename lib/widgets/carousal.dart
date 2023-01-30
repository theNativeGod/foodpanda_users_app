import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carousel extends StatelessWidget {
  final items = [
    "assets/slider/0.jpg",
    "assets/slider/1.jpg",
    "assets/slider/2.jpg",
    "assets/slider/3.jpg",
    "assets/slider/4.jpg",
    "assets/slider/5.jpg",
    "assets/slider/6.jpg",
    "assets/slider/7.jpg",
    "assets/slider/8.jpg",
    "assets/slider/9.jpg",
    "assets/slider/10.jpg",
    "assets/slider/11.jpg",
    "assets/slider/12.jpg",
    "assets/slider/13.jpg",
    "assets/slider/14.jpg",
    "assets/slider/15.jpg",
    "assets/slider/16.jpg",
    "assets/slider/17.jpg",
    "assets/slider/18.jpg",
    "assets/slider/19.jpg",
    "assets/slider/20.jpg",
    "assets/slider/21.jpg",
    "assets/slider/22.jpg",
    "assets/slider/23.jpg",
    "assets/slider/24.jpg",
    "assets/slider/25.jpg",
    "assets/slider/26.jpg",
    "assets/slider/27.jpg",
  ];
  Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * .3,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            autoPlayAnimationDuration: const Duration(milliseconds: 500),
            autoPlayCurve: Curves.decelerate,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          items: items.map((index) {
            return Builder(builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 1.0),
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    index,
                    fit: BoxFit.fill,
                  ),
                ),
              );
            });
          }).toList(),
        ),
      ),
    );
  }
}
