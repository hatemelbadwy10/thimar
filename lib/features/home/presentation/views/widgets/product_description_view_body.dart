import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/features/home/presentation/views/widgets/counter_widget.dart';
import 'package:thimar/features/home/presentation/views/widgets/icon_widget.dart';
import 'package:thimar/features/home/presentation/views/widgets/image_slider.dart';
import 'package:thimar/features/home/presentation/views/widgets/product_widget.dart';
import 'package:thimar/features/home/presentation/views/widgets/rating_widget.dart';
class ProductDescriptionViewBody extends StatelessWidget {
  const ProductDescriptionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconWidget(icon: const Icon(Icons.arrow_back), onPress: (){
                        GoRouter.of(context).pop(AppRouter.kHomeView);}),
                    IconWidget(icon: favIcon(), onPress: (){}),

                  ],

                ),
                const ImageSlider(),
                SizedBox(height: 15.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('طماطم',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        Text('السعر / 1كجم',
                        style: Styles.textStyle18.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w200
                        ),
                        ),

                      ],
                    ),
                    Column(
                      children: [
                      Text(' 45 ر.س',
                      style: Styles.textStyle20.copyWith(
                        fontWeight: FontWeight.bold
                      ),
                      ),
                        const CounterWidget(),



                    ],
                    )
                  ],
                ),
                SizedBox(height: 12.5.h,),
                Divider(
                  height: 2,
                  thickness: .25,
                  color: Theme.of(context).colorScheme.secondary,

                ),
                SizedBox(height: 14.5.h,),
                Align(
                  alignment: Alignment.topRight,
                  child: Row(
                    children: [
                      Text('كود المنتج',
                        style: Styles.textStyle18.copyWith(
                          fontWeight: FontWeight.bold
                        ),


                      ),
                      SizedBox(width: 8.w,),
                      Text('5604',
                      style: Styles.textStyle20.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.w200
                      ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.h,),
                Divider(
                  height: 2,
                  thickness: .25,
                  color: Theme.of(context).colorScheme.secondary,

                ),
                SizedBox(height: 16.h,),
                Align(
                  alignment: Alignment.topRight,
                  child: Text('تفاصيل المنتج',
                  style: Styles.textStyle20.copyWith(
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),
                SizedBox(height: 9.h,),
                Text('هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد'
                    ' الحروف التى يولدها التطبيق'
               ' إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص ' ,
                style: Styles.textStyle14.copyWith(
                  color: Theme.of(context).colorScheme.secondary
                ),
                ),
                SizedBox(height: 16.h,),
                Align(
                  alignment: Alignment.topRight,
                  child: Text('التقيمات',
                  style: Styles.textStyle20.copyWith(
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (index,context){
                    return const RatingWidget();
                  }),
                ),
                Text('منتجات متشابهه',
                style: Styles.textStyle20.copyWith(
                  fontWeight: FontWeight.bold
                ),

                ),
                SizedBox(
                  height: 280.h,

                  child: ListView.builder(

                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context ,index){
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal:  10.w),
                    child: const ProductWidget(),
                  ) ;
                  }),
                ),
                              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              GoRouter.of(context).push(AppRouter.kCartView);

            },
            child: Container(
            
              height: 80.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary
              ),
              child: Padding(
                padding:  EdgeInsets.only(right: 27.w, ),
                child: Row(
                  children: [
                    IconWidget(icon: const Icon(Icons.shopping_cart), onPress: (){}),
                    SizedBox(width:10.w),
                    Text('اضافة للسلة',
                      style: Styles.textStyle15.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
            
                    ),
                    SizedBox(width: 140.w,),
                    Text('رس 225 ',
                      style: Styles.textStyle15.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
            ),
          )



        ],

      ),
    );
  }
  Icon favIcon(){
    List favList =[];
    if(favList.contains('')){
      return  const Icon(

        Icons.favorite,
        color: Colors.red,
      );

    }
    else{
      return  const Icon(

        Icons.favorite_border_outlined,

      );
    }
  }
}
