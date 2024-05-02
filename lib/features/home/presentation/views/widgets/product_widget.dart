import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/utils/assets.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/core/widgets/custom_button.dart';
import 'package:thimar/features/home/data/models/product_model.dart';

import '../product_description_view.dart';

class ProductWidget extends StatelessWidget {
  final GetProductsData getProductsData;
  const ProductWidget({super.key, required this.getProductsData});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // GoRouter.of(context).push(AppRouter.kProductDescriptionView);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  ProductDescriptionView(id: getProductsData.id)),
        );
      },
      child: SizedBox(
        height: 300.h,
        width: 180.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 21.h,
                width: 54.h,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12))),
                child: Center(
                  child: Text(
                    getProductsData.discount.toString(),
                    style: Styles.textStyle14.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
                height: 117.h,
                width: double.infinity,
                child: Image.network(getProductsData.mainImage)),
            const Align(
                alignment: Alignment.topRight, child: Text(' السعر / 1كجم')),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(getProductsData.title.toString()),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).colorScheme.primary),
                  child: IconButton(
                    onPressed: () {
                      showBottomSheet(context: context, builder: (BuildContext context){
                        return Container(

                          height: 220,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft: Radius.circular(12))
                          ),
child: Padding(
  padding: const EdgeInsets.all(12.0),
  child: Column(
    children: [
      Row(
        children: [
          Container(
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12)
            ),
            child:  Icon(Icons.check,
            color:Theme.of(context).colorScheme.primary,
            ),
          ),
          SizedBox(width: 12.w,),
          Text('تم إضافة المنتج بنجاح',
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.bold
          ),
          ),
        ],
      ),
      SizedBox(height:10.h),
      const Divider(thickness: .5,),
      Row(
        children: [
          SizedBox(
              height:64.h,
              width: 70.w,
              child: Image.network(getProductsData.mainImage)),
          SizedBox(width: 11.w,),
          Column(children: [
            Text(getProductsData.title,
            style: Styles.textStyle14,
            ),
            SizedBox(height: 5.h,),
            Text(getProductsData.amount.toString(),
            style: Styles.textStyle14.copyWith(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w200
            ),


            ),
            SizedBox(width: 11.w,),
Text(getProductsData.price.toString(),
style: Styles.textStyle14,
),

          ],),

        ],
      ),
      SizedBox(height: 8.h,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomButton(onPress: (){}, btnText: 'التحويل إلى السلة',
          height: 40.h,
            width: 165.w,
          ),
          CustomButton(onPress: (){}, btnText: 'تصفح العروض',
          btnColor: Colors.white,
            btnTextColor: Theme.of(context).colorScheme.primary,
            height: 40.h,
            width: 165.w,
          )
        ],
      )


    ],
  ),
)
                          ,
                        );

                      });

                    },
                    icon: const Icon(Icons.add),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CustomButton(
                  onPress: () {},
                  btnText: 'اضف للسلة',
                  width: 200.w,
                  height: 40.h),
            )
          ],
        ),
      ),
    );
  }
}
