import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/features/favourite/presentation/manger/favourite_bloc/favourite_bloc.dart';
import 'package:thimar/features/home/presentation/manger/add_product_to_cart_bloc/add_product_to_cart_bloc.dart';
import 'package:thimar/features/home/presentation/manger/catgeory_product_bloc/category_product_state.dart';
import 'package:thimar/features/home/presentation/manger/product_details_bloc/product_details_bloc.dart';
import 'package:thimar/features/home/presentation/views/widgets/category_view_body.dart';
import 'package:thimar/features/home/presentation/views/widgets/counter_widget.dart';
import 'package:thimar/features/home/presentation/views/widgets/icon_widget.dart';
import 'package:thimar/features/home/presentation/views/widgets/rating_list_view.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/helper_methods.dart';
import '../../manger/catgeory_product_bloc/category_product_bloc.dart';
import '../../manger/catgeory_product_bloc/category_product_event.dart';

class ProductDescriptionViewBody extends StatefulWidget {
   ProductDescriptionViewBody({super.key, required this.id,required this.isFavourite});
  final int id;
  bool isFavourite;
  @override
  State<ProductDescriptionViewBody> createState() =>
      _ProductDescriptionViewBodyState();
}

class _ProductDescriptionViewBodyState
    extends State<ProductDescriptionViewBody> {
  final bloc = KiwiContainer().resolve<ProductDetailsBloc>();
  final samilarItemsBloc = KiwiContainer().resolve<CategoryProductBloc>();
  final favouriteBloc = KiwiContainer().resolve<FavouriteBloc>();
  final addProductToCartBloc = KiwiContainer().resolve<AddProductToCartBloc>();
  int counter =1;
  void _getData() {
    bloc.add(GetProductDetailsEvent(id: widget.id));
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
    samilarItemsBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listener: (BuildContext context, s) {
        if (s is ProductDetailsSuccess) {
          samilarItemsBloc
              .add(GetCategoryProductEvent(s.productDetailsModel.id));
        }
      },
      bloc: bloc,
      builder: (context, state) {
        if (state is ProductDetailsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ProductDetailsSuccess) {
          return SafeArea(
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
                          IconWidget(
                              icon: const Icon(Icons.arrow_back),
                              onPress: () {
                                GoRouter.of(context).pop(AppRouter.kHomeView);
                              }),
                          BlocBuilder(
   bloc: favouriteBloc
  ,builder: (context, state) {
    return IconWidget(icon: favIcon(), onPress: () {
      if (widget.isFavourite == false) {
        favouriteBloc.add(
          AddToFavouriteEvent(
            id: widget.id,
          ),
        );
        widget.isFavourite = !widget.isFavourite;
      } else {
        favouriteBloc.add(
          RemoveFromFavouriteEvent(
            id: widget.id,
          ),
        );
        widget.isFavourite = !widget.isFavourite;
      }
    },
                          );
  },
),
                        ],
                      ),
//const ProductDetailsImageSlider(),
                      Image.network(state.productDetailsModel.mainImage),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                state.productDetailsModel.title,
                                style: Styles.textStyle20
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'السعر / 1كجم',
                                style: Styles.textStyle18.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontWeight: FontWeight.w200),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                state.productDetailsModel.price.toString() +
                                    'رس',
                                style: Styles.textStyle20
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Container(
                                width: 109.w,
                                height: 35.h,
                                padding: EdgeInsetsDirectional.symmetric(
                                    horizontal: 5.w),
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadiusDirectional.circular(10.r),
                                  color: const Color(
                                    0xff707070,
                                  ).withOpacity(
                                    0.2,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    _FloatingActionButton(
                                      onPress: () {
                                        if (state.productDetailsModel.amount > counter) {
                                          counter++;
                                        } else {
                                          showSnackBar(
                                            "عفوا الكمية المطلوبة غير متوفرة",
                                          );
                                        }
                                        setState(() {});
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Theme.of(context).primaryColor,
                                        size: 16.r,
                                      ),
                                    ),
                                    Text(
                                      counter.toString(),
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    _FloatingActionButton(
                                      onPress: () {
                                        if (counter > 1) {
                                          counter--;
                                        } else {
                                          showSnackBar(
                                            "يجب ان تكون الكمية = 1 على الأقل",
                                          );
                                        }
                                        setState(() {});
                                      },
                                      icon: Icon(
                                        Icons.remove,
                                        color: Theme.of(context).primaryColor,
                                        size: 16.r,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12.5.h,
                      ),
                      Divider(
                        height: 2,
                        thickness: .25,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(
                        height: 14.5.h,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Row(
                          children: [
                            Text(
                              'كود المنتج',
                              style: Styles.textStyle18
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              state.productDetailsModel.code,
                              style: Styles.textStyle20.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontWeight: FontWeight.w200),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Divider(
                        height: 2,
                        thickness: .25,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'تفاصيل المنتج',
                          style: Styles.textStyle20
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 9.h,
                      ),
                      Text(
                        state.productDetailsModel.description,
                        style: Styles.textStyle14.copyWith(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'التقيمات',
                          style: Styles.textStyle20
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                          height: 90,
                          child: RatingListView(
                            id: state.productDetailsModel.id,
                          )),
                      Text(
                        'منتجات متشابهه',
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                          height: 280.h,
                          child: BlocBuilder(
                            bloc: samilarItemsBloc,
                            builder: (BuildContext context, state2) {
                              if (state2 is CategoryProductLoading) {
                                return CircularProgressIndicator();
                              } else if (state2 is CategoryProductSuccess) {
                                return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: state2.list.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        child: CategoryProductWidget(
                                          getProductsData: state2.list[index],
                                        ),
                                      );
                                    });
                              } else {
                                return SizedBox();
                              }
                            },
                          )),
                      BlocBuilder(
                        bloc: addProductToCartBloc,
  builder: (context, state3) {
   if(state3 is AddProductToCartLoading){
     return CircularProgressIndicator();
   }
   else if(state3 is AddProductToCartSuccess){
     return GestureDetector(
       onTap: () {
         addProductToCartBloc.add(SendProductToCartEvent(productId: widget.id, amount: 1));
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
                           child: Image.network( state.productDetailsModel.mainImage)),
                       SizedBox(width: 11.w,),
                       Column(children: [
                         Text(state.productDetailsModel.title,
                           style: Styles.textStyle14,
                         ),
                         SizedBox(height: 5.h,),
                         Text(
                           counter.toString(),
                           style: Styles.textStyle14.copyWith(
                               color: Theme.of(context).colorScheme.secondary,
                               fontWeight: FontWeight.w200
                           ),


                         ),
                         SizedBox(width: 11.w,),
                         Text('${counter*state.productDetailsModel.price}رس',
                           style: Styles.textStyle14,
                         ),

                       ],),

                     ],
                   ),
                   SizedBox(height: 8.h,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       CustomButton(onPress: (){
                         GoRouter.of(context).push(AppRouter.kCartView);
                       //  addProductToCartBloc.add(SendProductToCartEvent(productId: state.productDetailsModel.id, amount: state.productDetailsModel.amount));

                       }, btnText: 'التحويل إلى السلة',
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
       child: Container(
         height: 80.h,
         width: double.infinity,
         decoration: BoxDecoration(
             color: Theme.of(context).colorScheme.primary),
         child: Padding(
           padding: EdgeInsets.only(
             right: 10.w,
           ),
           child: Row(
             children: [
               IconWidget(
                   icon: const Icon(Icons.shopping_cart),
                   onPress: () {


                   }),
               SizedBox(width: 10.w),
               Text(
                 'اضافة للسلة',
                 style: Styles.textStyle15.copyWith(
                     color: Colors.white,
                     fontWeight: FontWeight.bold),
               ),
               SizedBox(
                 width: 140.w,
               ),
               Text(
                 '${counter*state.productDetailsModel.price}رس',
                 style: Styles.textStyle15.copyWith(
                     color: Colors.white,
                     fontWeight: FontWeight.bold),
               )
             ],
           ),
         ),
       ),
     );
   }
   else{
     return GestureDetector(
       onTap: () {
         addProductToCartBloc.add(SendProductToCartEvent(productId: widget.id, amount: 1));
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
                           child: Image.network( state.productDetailsModel.mainImage)),
                       SizedBox(width: 11.w,),
                       Column(children: [
                         Text(state.productDetailsModel.title,
                           style: Styles.textStyle14,
                         ),
                         SizedBox(height: 5.h,),
                         Text(
                           counter.toString(),
                           style: Styles.textStyle14.copyWith(
                               color: Theme.of(context).colorScheme.secondary,
                               fontWeight: FontWeight.w200
                           ),


                         ),
                         SizedBox(width: 11.w,),
                         Text(state.productDetailsModel.price.toString(),
                           style: Styles.textStyle14,
                         ),

                       ],),

                     ],
                   ),
                   SizedBox(height: 8.h,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       CustomButton(onPress: (){
                        // GoRouter.of(context).push(AppRouter.kCartView);
                         //  addProductToCartBloc.add(SendProductToCartEvent(productId: state.productDetailsModel.id, amount: state.productDetailsModel.amount));
                         GoRouter.of(context).push(AppRouter.kCartView);
                       }, btnText: 'التحويل إلى السلة',
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
       child: Container(
         height: 80.h,
         width: double.infinity,
         decoration: BoxDecoration(
             color: Theme.of(context).colorScheme.primary),
         child: Padding(
           padding: EdgeInsets.only(
             right: 10.w,
           ),
           child: Row(
             children: [
               IconWidget(
                   icon: const Icon(Icons.shopping_cart),
                   onPress: () {



                   }),
               SizedBox(width: 10.w),
               Text(
                 'اضافة للسلة',
                 style: Styles.textStyle15.copyWith(
                     color: Colors.white,
                     fontWeight: FontWeight.bold),
               ),
               SizedBox(
                 width: 140.w,
               ),
               Text(
                 '${counter*state.productDetailsModel.price}رس',
                 style: Styles.textStyle15.copyWith(
                     color: Colors.white,
                     fontWeight: FontWeight.bold),
               )
             ],
           ),
         ),
       ),
     );
   }
  },
)
                    ],
                  ),
                )
              ]));
        } else {
          return SizedBox();
        }
      },
    );
  }

  Icon favIcon() {

    if (widget.isFavourite==true) {
      return const Icon(
        Icons.favorite,
        color: Colors.red,
      );
    } else {
      return const Icon(
        Icons.favorite_border_outlined,
      );
    }

  }

}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton({
    required this.onPress,
    required this.icon,
  });

  final VoidCallback? onPress;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 29.w,
      height: 29.h,
      child: FloatingActionButton(
        onPressed: onPress,
        mini: true,
        heroTag: null,
        backgroundColor: const Color(0xffFFFFFF),
        elevation: 0.0,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            8.r,
          ),
          borderSide: BorderSide(
            color: const Color(
              0xff707070,
            ).withOpacity(0.1),
          ),
        ),
        child: icon,
      ),
    );
  }
}