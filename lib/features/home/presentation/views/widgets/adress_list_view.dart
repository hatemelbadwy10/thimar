import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';

import '../../../../../core/utils/app_routers.dart';
import '../../../data/models/address.dart';
import '../../manger/address_bloc/adress_bloc.dart';
import '../../manger/address_bloc/adress_event.dart';
import '../../manger/address_bloc/adress_state.dart';
import 'dot_button.dart';

class AddressesListView extends StatefulWidget {
  final Function(AddressModel) onSubmit;

  const AddressesListView({super.key, required this.onSubmit});

  @override
  State<AddressesListView> createState() => _AddressesListViewState();
}

class _AddressesListViewState extends State<AddressesListView> {
  final addressBloc = KiwiContainer().resolve<AddressBloc>();

  void _init() {
    addressBloc.add(
      GetUserAddressEvent(),
    );
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: addressBloc,
      builder: (context, state) {
        if (state is GetUserAddressLoadingState) {
          return Center(
              child: CircularProgressIndicator()
          );
        } else if (state is GetUserAddressSuccessState) {
          return SafeArea(
            child: ListView(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 12.w,
                vertical: 28.h,
              ),
              children: [
                Column(
                  children: [
                    state.list.isEmpty
                        ? const Text(
                      "لا توجد بيانات",
                    )
                        : ListView.separated(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          widget.onSubmit(state.list[index]);
                        },
                        child: Container(
                          width: 343.w,
                          height: 140.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: const Color(
                              0xffffffff,
                            ),
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.only(
                                      start: 16.w,
                                    ),
                                    child: Text(
                                      state.list[index].type,
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 217.w,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.all(
                                      5.r,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        addressBloc.deleteItem(
                                          state.list[index],
                                        );
                                        state.list.removeWhere(
                                              (element) =>
                                          element.id ==
                                              state.list[index].id,
                                        );
                                        setState(() {});
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        size: 24.r,


                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.all(
                                      5.r,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        // navigateTo(
                                        //   AddAddress(
                                        //     model: state.list[index],
                                        //     isEditing: false,
                                        //   ),
                                        // ).then((x) {
                                        //   print('-==-=-= here');
                                        //   _init();
                                        // });
                                      },
                                      child: Icon(
                                        Icons.edit_outlined,
                                        size: 24.r,

                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                  start: 16.w,
                                ),
                                child: Text(
                                  "العنوان : ${state.list[index].location}",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                  start: 16.w,
                                ),
                                child: Text(
                                  "الوصف : ${state.list[index].description}",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w300,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                  start: 16.w,
                                ),
                                child: Text(
                                  "رقم الجوال : ${state.list[index].phone}",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w300,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 20.h,
                      ),
                      itemCount: state.list.length,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    DotButton(
                      text: "إضافة عنوان",
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.KAddAddressView).then((x) {
                          print('-==-=-= here');
                          _init();
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
