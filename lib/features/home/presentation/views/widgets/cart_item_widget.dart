import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/features/home/data/models/cart_model.dart';
import 'package:thimar/features/home/presentation/manger/delete_product_cart/delete_product_bloc.dart';
import 'package:thimar/features/home/presentation/manger/get_cart_data_bloc/get_cart_data_bloc.dart';
import 'package:thimar/features/home/presentation/views/widgets/icon_widget.dart';
import '../../../../../core/widgets/helper_methods.dart';
import '../../manger/update_cart_bloc/update_cart_bloc.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget({super.key, required this.cartData});

  final CartData cartData;

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  int counter = 1;
  final bloc = KiwiContainer().resolve<GetCartDataBloc>();
  final updateBloc = KiwiContainer().resolve<UpdateCartBloc>();
  final deleteBloc = KiwiContainer().resolve<DeleteProductBloc>();
@override
  void initState() {
    super.initState();
    counter= widget.cartData.amount;
  }
  void _init() {
    print('=========================================');
    print('i update update');

    print('=========================================');
    bloc.add(
      GetDataEvent(),
    );
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
    return BlocListener<UpdateCartBloc,UpdateCartState>(
      bloc: updateBloc,
      listener: (context, state) {
        if (state
        is UpdateCartSuccess) {
                 _init();
        }
        else if(state is UpdateCartFailure){
                }
        else if(state is UpdateCartLoading){
        }
        else {
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
              Image.network(widget.cartData.image)),
          SizedBox(width: 9.w,),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(widget.cartData.title,
                  style: Styles.textStyle15.copyWith(
                      fontWeight: FontWeight.bold
                  ),

                ),
              ),
              Text('رس ${widget.cartData.price}',
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
                             counter <
                              widget.cartData
                                  .remainingAmount) {

                            counter++;
                            _update(
                                    widget.cartData.id,
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

                                widget.cartData.id,
                                counter);
                          } else {
                           deleteBloc.add(SendDeletedProductEvent(id: widget.cartData.id));
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
            deleteBloc.add(SendDeletedProductEvent(id: widget.cartData.id));
          },
            color: const Color(0xffFF0000).withOpacity(.1),

          )
        ],
      ),
    );
  }
}
