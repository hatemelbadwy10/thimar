import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/widgets/custom_text_field.dart';
import 'package:thimar/features/home/data/models/categorys_model.dart';
import 'package:thimar/features/home/presentation/manger/add_product_to_cart_bloc/add_product_to_cart_bloc.dart';
import 'package:thimar/features/home/presentation/manger/catgeory_product_bloc/category_product_bloc.dart';
import 'package:thimar/features/home/presentation/manger/catgeory_product_bloc/category_product_event.dart';
import 'package:thimar/features/home/presentation/manger/catgeory_product_bloc/category_product_state.dart';
import 'package:thimar/features/home/presentation/views/widgets/custom_header.dart';
import 'package:thimar/features/home/presentation/views/widgets/product_widget.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../data/models/category_products_model.dart';
import '../product_description_view.dart';

class CategoryViewBody extends StatefulWidget {
  const CategoryViewBody({super.key, required this.id});
  final int id;

  @override
  State<CategoryViewBody> createState() => _CategoryViewBodyState();
}

class _CategoryViewBodyState extends State<CategoryViewBody> {
    final bloc = KiwiContainer().resolve<CategoryProductBloc>();
    late final CategoryData data;
void _getData(){
  bloc.add(GetCategoryProductEvent(widget.id));

}
@override
  void initState() {
    // TODO: implement initState
    _getData();
  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bloc.close();
  }

    @override
    Widget build(BuildContext context) {
      return SafeArea(
        child: Column(
          children: [
            CustomAppBarSec(text: '', onPress: () {
              GoRouter.of(context).pop(AppRouter.kHomeView);
            }),
            const CustomTextField(hint: 'ابحث عن ماتريد؟',
                icon: Icon(Icons.search),
                validatorWord: ''),
            SizedBox(height: 30.h,),
            BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                if(state is CategoryProductLoading){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else if(state is CategoryProductSuccess){
                  return Expanded(
                    child: GridView.builder(
                        physics: const ScrollPhysics(),

                        itemCount: state.list.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 3,
                            childAspectRatio: 190 / 350,
                            crossAxisCount: 2
                        ),
                        itemBuilder: (context, index) {
                          return  CategoryProductWidget(getProductsData: state.list[index]);

                        }),

                  );
                }
                else{
                  return const SizedBox();
                }

              },
            )

          ],

        ),
      );
    }
}


class CategoryProductWidget extends StatefulWidget {
  final ProductsData getProductsData;
  const CategoryProductWidget({super.key, required this.getProductsData});
  

  @override
  State<CategoryProductWidget> createState() => _CategoryProductWidgetState();
}
final bloc = KiwiContainer().resolve<AddProductToCartBloc>();
class _CategoryProductWidgetState extends State<CategoryProductWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
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
                   "${widget.getProductsData.discount*100 }%",
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
             Align(
                alignment: Alignment.topRight,
                child: Text(widget.getProductsData.title)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(' السعر / 1كجم'),
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
                                      Text(
                                        "  الكميه: ${widget.getProductsData.unit} ",
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
                                ),
                                Text(widget.getProductsData.price.toString())


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
bloc.add(SendProductToCartEvent(productId: widget.getProductsData.id, amount: 1));
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

