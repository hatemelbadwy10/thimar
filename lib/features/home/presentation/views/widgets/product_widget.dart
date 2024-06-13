import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/core/widgets/custom_button.dart';
import 'package:thimar/features/home/data/models/product_model.dart';
import 'package:thimar/features/home/presentation/manger/add_product_to_cart_bloc/add_product_to_cart_bloc.dart';

import '../product_description_view.dart';

class ProductWidget extends StatefulWidget {
  final GetProductsData getProductsData;
  
  const ProductWidget({super.key, required this.getProductsData});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}
final bloc = KiwiContainer().resolve<AddProductToCartBloc>();
class _ProductWidgetState extends State<ProductWidget> {
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
                    "${widget.getProductsData.discount*100}%",
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
                alignment: Alignment.topRight, child: Text(widget.getProductsData.title)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(' السعر / 1كجم'),


              ],
            ),
            SizedBox(height: 12.h),
            BlocBuilder(
              bloc :bloc,
  builder: (context, state) {
   if(state is AddProductToCartLoading&& state.id==widget.getProductsData.id){
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
