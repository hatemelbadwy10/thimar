import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../data/models/product_rate_model.dart';
class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key, required this.ratingData});
final RatingData ratingData;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Row(
                children: [
                Text(ratingData.clientName,
                style: Styles.textStyle16.copyWith(
                  color: Colors.black,
                ),
                ),
                SizedBox(width: 7.w,),
                RatingBar.builder(
                  initialRating: ratingData.value,
                  minRating:
                  ratingData.value,
                  maxRating:
                  ratingData.value,
                    itemCount: 5,
                    itemSize: 20,
                    unratedColor: Colors.grey,

                    allowHalfRating: true,
                    direction: Axis.horizontal,
                    itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                    ),

                 onRatingUpdate: (double value) {

                },
                )
              ],
              ),
            ),
            Text(ratingData.comment,
            style: Styles.textStyle14.copyWith(
              overflow:TextOverflow.ellipsis,
              color: Theme.of(context).colorScheme.secondary
            ),
            )
          ],
          ),
          SizedBox(width: 55.w,),
          SizedBox(
              height: 55.h,
              width: 55.w,
              child: Image.network(ratingData.clientImage)),
        ],
      ),
    );
  }
}
