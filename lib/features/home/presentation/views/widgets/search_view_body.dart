import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/features/home/presentation/views/product_description_view.dart';

import '../../../../../core/utils/helper.dart';
import '../../../../profile/presentation/views/widgets/personal_info_view_body.dart';
import '../../manger/add_product_to_cart_bloc/add_product_to_cart_bloc.dart';
import '../../manger/category_bloc/category_bloc.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchViewBody> {
  final bloc = KiwiContainer().resolve<CategoryBloc>();

  final cartBloc = KiwiContainer().resolve<AddProductToCartBloc>();

  @override
  void dispose() {
    super.dispose();
    bloc.close();
    cartBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
        'البحث',
        ),
        leading: Padding(
          padding: EdgeInsetsDirectional.all(
            10.r,
          ),
          child: GestureDetector(
            child: Container(
              width: 32.w,
              height: 32.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(9.r),
                color: const Color(
                  0xff707070,
                ).withOpacity(0.1),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  start: 7.w,
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 16.r,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 10.w,
                vertical: 20.h,
              ),
              child: AppInput(
                controller: bloc.searchController,
                isFilled: true,
                isSearch: true,
                labelText: 'ابحث',
                prefixIcon:Icon(Icons.search),
                onChanged: (value) {
                  bloc.add(
                    GetSearchDataEvent(
                      keyWord: value.toString(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Expanded(
              child: BlocBuilder(
                bloc: bloc,
                builder: (context, state) {
                  if (state is GetSearchDataSuccessState) {
                    return state.data.isEmpty
                        ? SizedBox()
                        : GridView.builder(
                      padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 10.w,
                      ),
                      itemCount: state.data.length,
                      itemBuilder: (context, index) => Container(
                        height: 250.h,
                        width: 163.w,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadiusDirectional.circular(17.r),
                          color: const Color(
                            0xffffffff,
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5.r,
                              color: const Color(
                                0xfff5f5f5,
                              ),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                GestureDetector(
                                  child: Container(
                                    margin: EdgeInsetsDirectional.only(
                                      top: 9.h,
                                      start: 9.w,
                                      end: 9.w,
                                    ),
                                    clipBehavior:
                                    Clip.antiAliasWithSaveLayer,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        11.r,
                                      ),
                                    ),
                                    child: Image.network(
                                      state.data[index].mainImage,
                                      fit: BoxFit.cover,
                                      width: 145.w,
                                      height: 117.h,
                                    ),
                                  ),
                                  onTap: () {
                                    navigateTo(
                                      ProductDescriptionView(
                                        id: state.data[index].id,
                                        isFavourite:
                                        state.data[index].isFavorite,

                                      ),
                                    );
                                  },
                                ),
                                Align(
                                  alignment: AlignmentDirectional.topEnd,
                                  child: Container(
                                    margin: EdgeInsetsDirectional.only(
                                      top: 9.h,
                                      end: 18.w,
                                    ),
                                    width: 54.w,
                                    height: 20.h,
                                    decoration: BoxDecoration(
                                      color:
                                      Theme.of(context).primaryColor,
                                      borderRadius:
                                      BorderRadiusDirectional.only(
                                        bottomStart:
                                        Radius.circular(25.r),
                                        topEnd: Radius.circular(11.r),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${state.data[index].discount * 100} %",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(
                                            0xffFFFFFF,
                                          ),
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
                                  state.data[index].title,
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
                                 '',
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
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                start: 9.w,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Align(
                                        alignment:
                                        AlignmentDirectional.topStart,
                                        child: Text(
                                          "${state.data[index].price} ",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional
                                            .bottomStart,
                                        child: Text(
                                          "${state.data[index].priceBeforeDiscount} ",
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            color: Theme.of(context)
                                                .primaryColor,
                                            decoration: TextDecoration
                                                .lineThrough,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 19.h,
                            ),
                            Align(
                              alignment: AlignmentDirectional.center,
                              child: Padding(
                                padding: EdgeInsetsDirectional.only(
                                  end: 24.w,
                                  start: 24.w,
                                  bottom: 10.h,
                                ),
                                child: state.data[index].amount != 0
                                    ? BlocBuilder(
                                  builder: (context, sA) {
                                    if (sA
                                    is AddProductToCartLoading) {
                                      return const Center(
                                        child:
                                        LinearProgressIndicator(),
                                      );
                                    } else {
                                      return AppButton(
                                        onTap: () {
                                          cartBloc.add(
                                            SendProductToCartEvent(
                                              productId: state
                                                  .data[index].id,
                                              amount: state
                                                  .data[index]
                                                  .amount.toInt(),
                                            ),
                                          );
                                        },
                                        text:'',
                                        width: 120.w,
                                        height: 30.h,
                                        radius: 9.r,
                                        backColor: const Color(
                                          0xff61B80C,
                                        ),
                                      );
                                    }
                                  },
                                  bloc: cartBloc,
                                )
                                    : AppButton(
                                  onTap: () {},
                                  text:'اضافه',
                                  width: 120.w,
                                  height: 30.h,
                                  radius: 9.r,
                                  backColor: Colors.white,
                                  textColor: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 10.h,
                        childAspectRatio: 0.6,
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onTap,
    required this.text,
    this.backColor,
    this.textColor,
    this.width,
    this.height,
    this.radius,
    this.isLoading = false,
  });

  final VoidCallback onTap;
  final String text;
  final Color? backColor;
  final Color? textColor;
  final double? width, height, radius;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const FittedBox(
      fit: BoxFit.scaleDown,
      child: CircularProgressIndicator(),
    )
        : Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius!,
        ),
        color: backColor ?? Theme.of(context).primaryColor,
      ),
      child: MaterialButton(
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? const Color(0xFFFFFFFF),
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
