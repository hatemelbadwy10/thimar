import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:thimar/core/utils/assets.dart';
import 'package:thimar/features/home/presentation/manger/slider_bloc/slider_bloc.dart';
import 'package:thimar/features/home/presentation/manger/slider_bloc/slider_event.dart';
import 'package:thimar/features/home/presentation/manger/slider_bloc/slider_state.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    super.key,
  });

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentIndex = 0;
  final bloc = KiwiContainer().resolve<SliderBloc>()
    ..add(GetSliderEvent());
  List images = [
    AssetsData.test,
    AssetsData.tomato,
    AssetsData.test
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc:bloc,
      builder: (context, state) {
        if (state is SliderLoading) {
          return SizedBox(
            width: double.infinity,
            height: 164.h,
            child: Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.4),
              highlightColor: Colors.grey.withOpacity(0.8),
              child: Container(
                color: Colors.grey.withOpacity(0.4),
              ),
            ),
          );
        }
        else if(state is SliderSuccess){
          return GestureDetector(
            onTap: () {},
            child: SizedBox(
              height: 200,
              child: Stack(
                children: [
                  CarouselSlider.builder(
                    itemCount:state.data.length,
                    itemBuilder: (context, currentIndex, pageViewIndex) {
                      return Padding(
                        padding: const EdgeInsets.all(12),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            state.data[currentIndex].media,
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
                        count: state.data.length,
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
        else{
          return SizedBox.shrink();
        }

      },
    );
  }
}
