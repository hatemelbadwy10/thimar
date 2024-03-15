import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:thimar/core/utils/assets.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    super.key,
  });
  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentIndex = 0;
  List images = [
    AssetsData.test,
    AssetsData.tomato,
    AssetsData.test
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: 200,
        child: Stack(
          children: [
            CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (context, currentIndex, pageViewIndex) {
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      images[currentIndex],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                  height: 200.h,
                  autoPlay: true,
                  viewportFraction: 1,
                  autoPlayInterval: const Duration(seconds: 2),
                  onPageChanged: (index, carouselPageChangedReason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedSmoothIndicator(
                  activeIndex: _currentIndex,
                  count: images.length,
                  effect: const ScaleEffect(
                    activeDotColor: Colors.white,
                    dotColor: Colors.grey,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
