import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:shimmer/shimmer.dart';
import 'package:thimar/core/utils/assets.dart';
import 'package:thimar/features/home/presentation/manger/category_bloc/category_bloc.dart';
import 'package:thimar/features/home/presentation/views/widgets/category_item.dart';

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
