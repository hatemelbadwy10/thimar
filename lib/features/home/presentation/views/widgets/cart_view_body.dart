import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/core/widgets/custom_button.dart';
import 'package:thimar/features/home/presentation/manger/add_cupon_bloc/add_cupon_bloc.dart';
import 'package:thimar/features/home/presentation/manger/get_cart_data_bloc/get_cart_data_bloc.dart';
import 'package:thimar/features/home/presentation/manger/update_cart_bloc/update_cart_bloc.dart';
import 'package:thimar/features/home/presentation/views/widgets/cart_item_widget.dart';
import 'package:thimar/features/home/presentation/views/widgets/custom_header.dart';
import 'package:thimar/features/home/presentation/views/widgets/receipt_widget.dart';

import '../../../../../core/widgets/helper_methods.dart';
import '../../manger/delete_product_cart/delete_product_bloc.dart';
import 'icon_widget.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}
int counter =1;
final bloc = KiwiContainer().resolve<GetCartDataBloc>()
  ..add(GetDataEvent());
final deleteBloc = KiwiContainer().resolve<DeleteProductBloc>();
final updateBloc = KiwiContainer().resolve<UpdateCartBloc>();
class _CartViewBodyState extends State<CartViewBody> {

  void _init() {
    bloc.add(
      GetDataEvent(),
    );
  }
  void dispose() {
    super.dispose();
    bloc.close();
    updateBloc.close();
    couponBloc.close();
  }
  void _update(int id, int amount) {

    print('=========================================');
    print('i send update');
    print("amount is ${amount} and id is ${id}");
    print('=========================================');
    setState(() {});
    bloc.add(GetDataEvent());
    updateBloc.add(
      SendUpdateEvent(
        id: id,
        amount: amount,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        if (state is GetCartDataLoading) {
          return Center(child: CircularProgressIndicator());
        }
        else if (state is GetCartDataSuccess) {

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SafeArea(
              child: Column(
                children: [
                  CustomAppBarSec(
                      text: 'السلة',
                      onPress: () {
                        GoRouter.of(context).pop(
                            AppRouter.kProductDescriptionView);
                      }),
                  Expanded(
                    child: ListView.builder(
                        itemCount: state.list.length,
                        itemBuilder: (context, index) {
                          counter = state.list[index].amount;
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0.h),
                            child:  BlocListener<UpdateCartBloc,UpdateCartState>(
                              bloc: updateBloc,
                              listener: (context, state) {
                                if (state
                                is UpdateCartSuccess) {

                                  _init();
                                }

                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12)
                                      ),
                                      height: 78.h,
                                      width: 28.w,
                                      child:
                                      Image.network(state.list[index].image)),
                                  SizedBox(width: 9.w,),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(state.list[index].title,
                                          style: Styles.textStyle15.copyWith(
                                              fontWeight: FontWeight.bold
                                          ),

                                        ),
                                      ),
                                      Text('رس ${state.list[index].price}',
                                        style: Styles.textStyle14.copyWith(
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Container(
                                        width: 72.w,
                                        height: 27.h,
                                        padding: EdgeInsetsDirectional
                                            .symmetric(
                                          horizontal: 2.w,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadiusDirectional
                                              .circular(7.r),
                                          color: const Color(
                                            0xff707070,
                                          ).withOpacity(
                                            0.2,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 23.w,
                                              height: 23.h,
                                              child: FloatingActionButton(
                                                onPressed: () {
                                                  if (
                                                  counter<
                                                      state.list[index].remainingAmount) {

                                                    counter++;
                                                    _update(
                                                        state.list[index].id,
                                                       counter);
                                                  } else {
                                                    showSnackBar(
                                                      "الكمية غير متاحة",
                                                      typ: MessageType
                                                          .warning,
                                                    );
                                                  }
                                                },
                                                mini: true,
                                                heroTag: null,
                                                backgroundColor:
                                                const Color(
                                                    0xffFFFFFF),
                                                elevation: 0.0,
                                                shape: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                    7.r,
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: const Color(
                                                      0xff707070,
                                                    ).withOpacity(0.1),
                                                  ),
                                                ),
                                                child: Icon(
                                                  Icons.add,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  size: 16.r,
                                                ),
                                              ),
                                            ),
                                            Text(
                                          counter
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight:
                                                FontWeight.w400,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 23.w,
                                              height: 23.h,
                                              child: FloatingActionButton(
                                                onPressed: () {
                                                  if (
                                                 counter >
                                                      1) {

                                                   counter--;
                                                    _update(

                                                        state.list[index].id,
                                                        counter);
                                                  } else {
                                                    deleteBloc.add(SendDeletedProductEvent(id: state.list[index].id));
                                                    _init();
                                                  }
                                                },
                                                mini: true,
                                                heroTag: null,
                                                backgroundColor:
                                                const Color(
                                                    0xffFFFFFF),
                                                elevation: 0.0,
                                                shape: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                    7.r,
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: const Color(
                                                      0xff707070,
                                                    ).withOpacity(0.1),
                                                  ),
                                                ),
                                                child: Icon(
                                                  Icons.remove,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  size: 16.r,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(width: 140.w,),
                                  IconWidget(icon: const Icon(FontAwesomeIcons.trash,
                                    color: Color(0xffFF0000),
                                  ), onPress: () {
                                    deleteBloc.add(SendDeletedProductEvent(id: state.list[index].id));
                                    _init();
                                  },
                                    color: const Color(0xffFF0000).withOpacity(.1),

                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  const CouponWidget(),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'جميع الأسعار تشمل قيمة الضريبة المضافة %15',
                    style: Styles.textStyle14,
                  ),
                  ReceiptWidget(cartModel: state.cartModel,),
                  const SizedBox(
                    height: 11,
                  ),
                  CustomButton(onPress: () {
                    GoRouter.of(context).push(AppRouter.kFinishOrderView);
                  }, btnText: 'اتمام الطلب'),
                  SizedBox(height: 20.h,)
                ],
              ),
            ),
          );
        }
        else {
          return SizedBox();
        }
      },
    );
  }
}

class CouponWidget extends StatefulWidget {

  const CouponWidget({
    super.key,
  });

  @override
  State<CouponWidget> createState() => _CouponWidgetState();
}
final couponBloc = KiwiContainer().resolve<AddCouponBloc>();
class _CouponWidgetState extends State<CouponWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: couponBloc,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: couponBloc.couponController,
            decoration: InputDecoration(

              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              hintText: 'عندك كوبون ؟ ادخل رقم الكوبون',
              border: InputBorder.none,
              suffixIcon: CustomButton(
                onPress: () {
                  couponBloc.add(SendCouponEvent());
                },
                btnText: 'تطبيق',
                height: 39,
                width: 100,
              ),
            ),
          ),
        );
      },
    );
  }
}
