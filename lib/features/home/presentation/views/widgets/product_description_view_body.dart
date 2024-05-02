import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/features/home/presentation/manger/catgeory_product_bloc/category_product_state.dart';
import 'package:thimar/features/home/presentation/manger/product_details_bloc/product_details_bloc.dart';
import 'package:thimar/features/home/presentation/views/widgets/category_view_body.dart';
import 'package:thimar/features/home/presentation/views/widgets/counter_widget.dart';
import 'package:thimar/features/home/presentation/views/widgets/icon_widget.dart';
import 'package:thimar/features/home/presentation/views/widgets/rating_list_view.dart';

import '../../manger/catgeory_product_bloc/category_product_bloc.dart';
import '../../manger/catgeory_product_bloc/category_product_event.dart';

class ProductDescriptionViewBody extends StatefulWidget {
  const ProductDescriptionViewBody({super.key, required this.id});
  final int id;
  @override
  State<ProductDescriptionViewBody> createState() =>
      _ProductDescriptionViewBodyState();
}

class _ProductDescriptionViewBodyState
    extends State<ProductDescriptionViewBody> {
  final bloc = KiwiContainer().resolve<ProductDetailsBloc>();
  final samilarItemsBloc = KiwiContainer().resolve<CategoryProductBloc>();
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
                          IconWidget(icon: favIcon(), onPress: () {}),
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
                              const CounterWidget(),
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
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kCartView);
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
                                    onPress: () {}),
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
                                  'رس 225 ',
                                  style: Styles.textStyle15.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
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
    List favList = [];
    if (favList.contains('')) {
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
