import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/features/home/presentation/manger/category_bloc/category_bloc.dart';
import 'package:thimar/features/home/presentation/views/widgets/category_item.dart';
import 'package:thimar/features/home/presentation/views/widgets/shimmer_widget.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({super.key});

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  final bloc = KiwiContainer().resolve<CategoryBloc>()..add(GetCategoryEvent());

  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder(
        bloc:bloc,
        builder: (context, state) {
          if (state is CategoryLoading)
          {
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 10.w,
              ),
              itemCount: 7,
              itemBuilder: (context, index) =>ShimmerWidget(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                childAspectRatio: 0.652,
              ),
              shrinkWrap: true,
            );
          }
          else if(state is CategorySuccess){
            return SizedBox(
              height: 125.h,
              width: double.infinity,
              child: ListView.builder(
                itemCount: state.categoryData.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return  CategoryItem(data: state.categoryData[index],);
                  }),
            );
          }
          else{
            return const SizedBox(
              height: 250,
            );
          }


        },
      )
    ;
  }
}
