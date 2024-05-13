
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:shimmer/shimmer.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/features/favourite/data/favourite_model.dart';
import 'package:thimar/features/favourite/presentation/manger/favourite_bloc/favourite_bloc.dart';
import 'package:thimar/features/home/presentation/manger/add_product_to_cart_bloc/add_product_to_cart_bloc.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../home/presentation/views/product_description_view.dart';
class FavViewBody extends StatefulWidget {
  const FavViewBody({super.key});
  @override
  State<FavViewBody> createState() => _FavViewBodyState();

}
final bloc = KiwiContainer().resolve<FavouriteBloc>()..add(GetFavouriteListEvent());

class _FavViewBodyState extends State<FavViewBody> {
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder(bloc: bloc,builder: (context,state){
      if(state is FavouriteLoading){
        return   GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 10.w,
          ),
          itemCount: 7,
          itemBuilder: (context, index) => Shimmer.fromColors(
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
                        width: 54.w,
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
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 10.h,
            childAspectRatio: 0.652,
          ),
          shrinkWrap: true,
        );
      }
      else if(state is FavouriteSuccess){
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text('المفضلة',
                    style: Styles.textStyle20.copyWith(
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(height: 26.h,),
                Expanded(
                  child: GridView.builder(
                      physics: const ScrollPhysics(),

                      itemCount: state.list.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing:3,
                          childAspectRatio: 190/350,
                          crossAxisCount: 2
                      ),
                      itemBuilder: (context,index){
                         return  FavProductWidget(getProductsData: state.list[index],);
                      }),
                )
              ],
            ),
          ),
        );
      }
      else{
        return SizedBox();
      }

      }

    );

    }


  }


class FavProductWidget extends StatefulWidget {
  final FavouritesModel getProductsData;
  const FavProductWidget({super.key, required this.getProductsData});

  @override
  State<FavProductWidget> createState() => _FavProductWidgetState();
}
final bloc2 = KiwiContainer().resolve<AddProductToCartBloc>();
class _FavProductWidgetState extends State<FavProductWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // GoRouter.of(context).push(AppRouter.kProductDescriptionView);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  ProductDescriptionView(id: widget.getProductsData.id, isFavourite: widget.getProductsData.isFavorite,)),
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
                    widget.getProductsData.discount.toString(),
                    style: Styles.textStyle14.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
                height: 117.h,
                width: double.infinity,
                child: Image.network(widget.getProductsData.mainImage)),
            const Align(
                alignment: Alignment.topRight, child: Text(' السعر / 1كجم')),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.getProductsData.title.toString()),
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
                                        child: Image.network(widget.getProductsData.mainImage)),
                                    SizedBox(width: 11.w,),
                                    Column(children: [
                                      Text(widget.getProductsData.title,
                                        style: Styles.textStyle14,
                                      ),
                                      SizedBox(height: 5.h,),
                                      Text(widget.getProductsData.amount.toString(),
                                        style: Styles.textStyle14.copyWith(
                                            color: Theme.of(context).colorScheme.secondary,
                                            fontWeight: FontWeight.w200
                                        ),


                                      ),
                                      SizedBox(width: 11.w,),
                                      Text(widget.getProductsData.price.toString(),
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
            BlocBuilder(
              bloc: bloc,
  builder: (context, state) {
  if(state is AddProductToCartLoading){
    return CircularProgressIndicator();
  }
  else{
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CustomButton(
          onPress: () {
            bloc2.add(SendProductToCartEvent(productId: widget.getProductsData.id, amount: 1));
          },
          btnText: 'اضف للسلة',
          width: 200.w,
          height: 40.h),
    );
  }
  },
)
          ],
        ),
      ),
    );
  }
}

