
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/features/home/presentation/views/widgets/product_widget.dart';
class FavViewBody extends StatelessWidget {
  const FavViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16),

      child: ListView(
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
          GridView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing:3,
              childAspectRatio: 190/350,
              crossAxisCount: 2
          ),
              itemBuilder: (context,index){
            return const ProductWidget();

              })
        ],
      ),
    );
  }
}
