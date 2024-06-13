import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/assets.dart';
class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.4),
      highlightColor: Colors.grey.withOpacity(0.8),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadiusDirectional.circular(
                    11.r,
                  ),
                ),
                margin: EdgeInsetsDirectional.only(
                  top: 20.h,
                  start: 9.w,
                  end: 20.w,
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Center(
                  child: Image.asset(
                    AssetsData.logo,
                    fit: BoxFit.scaleDown,
                    width: 70.w,
                    height: 70.h,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: Container(
                  margin: EdgeInsetsDirectional.only(
                    top: 9.h,
                    end: 28.w,
                  ),
                  width: 50.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius:
                    BorderRadiusDirectional.only(
                      bottomStart: Radius.circular(25.r),
                      topEnd: Radius.circular(11.r),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "الخصم",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: 10.w,
            ),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                "اسم المنتج",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: 11.w,
            ),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                "السعر / كيلو",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xFF808080),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      "السعر بعد \n الخصم ر.س",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Align(
                    alignment:
                    AlignmentDirectional.bottomStart,
                    child: Text(
                      "السعر قبل \n الخصم ر.س",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Theme.of(context).primaryColor,
                        decoration:
                        TextDecoration.lineThrough,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
