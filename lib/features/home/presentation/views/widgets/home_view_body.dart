import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/utils/helper.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/core/widgets/custom_text_field.dart';
import 'package:thimar/features/home/presentation/manger/prdouct_bloc/product_bloc.dart';
import 'package:thimar/features/home/presentation/views/search_view.dart';
import 'package:thimar/features/home/presentation/views/widgets/category_last_view.dart';
import 'package:thimar/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:thimar/features/home/presentation/views/widgets/image_slider.dart';
import 'package:thimar/features/home/presentation/views/widgets/product_widget.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}
final bloc = KiwiContainer().resolve<ProductBloc>()..add(GetProductEvent( ));


class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Padding(
        padding: const EdgeInsets.all( 16,),
        child: SingleChildScrollView(


         child: Column( children: [
            const CustomAppBar(),
            SizedBox(height: 20.h,),
            GestureDetector(
              onTap: (){
                navigateTo(SearchView());
              },
              child: CustomTextField(
                fill:true,
                hint: 'ابحث عن ما تريد؟',
                icon: const Icon(FontAwesomeIcons.search),
                validatorWord: '',
              color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
            SizedBox(height: 24.h,),
              const ImageSlider(),
            SizedBox(height: 30.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('الاقسام',
                style: Styles.textStyle15.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w900
                ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: Text('عرض الكل',
                  style: Styles.textStyle15.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w200
                  ),
                  ),
                ),
              ],
            ),
            const CategoryListView(),
             SizedBox(height:26.h),
             Align(
               alignment: Alignment.topRight,
               child: Text('الاصناف',
                  style: Styles.textStyle15.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w900
                  ),

                ),
             ),
           BlocBuilder(
           bloc: bloc
           ,builder: (context,state){
             if(state is ProductLoading){
               return const Center(child: CircularProgressIndicator());
             }
             else if(state is ProductSuccess){
               return GridView.builder(

                   shrinkWrap: true,
                   physics: const ScrollPhysics(),
                   itemCount: state.list.length,
                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisSpacing:2,
                       childAspectRatio: 190/350,
                       crossAxisCount: 2
                   ),
                   itemBuilder: (context, index) {

                     return  ProductWidget(getProductsData: state.list[index],);
                   }

               );

             }
             else{return SizedBox();}
           }
           )


          ],

        ),
      ),
      )
    );
  }
}
