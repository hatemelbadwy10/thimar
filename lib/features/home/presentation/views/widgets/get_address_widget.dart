import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import '../../manger/address_bloc/adress_bloc.dart';
import '../../manger/address_bloc/adress_event.dart';
import '../../manger/address_bloc/adress_state.dart';
import '../../manger/orders/orders_event.dart';
import 'adress_list_view.dart';
class GetAddressWidget extends StatefulWidget {
  const GetAddressWidget({super.key});

  @override
  State<GetAddressWidget> createState() => _GetAddressWidgetState();
}
final _event = PostOrderDataEvent();
final addressBloc = KiwiContainer().resolve<AddressBloc>();

class _GetAddressWidgetState extends State<GetAddressWidget> {
  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(
                38.r,
              ),
              topEnd: Radius.circular(
                38.r,
              ),
            ),
          ),
          context: context,
          builder: (context) => BlocBuilder(
            bloc: addressBloc
              ..add(
                GetUserAddressEvent(),
              ),
            builder: (context, state) {
              if (state is GetUserAddressLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state
              is GetUserAddressSuccessState) {
                return Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                      child: Text(
                        "العناوين",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color:
                          Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: AddressesListView(onSubmit: (x) {
                        _event.addressModel = x;
                        Navigator.of(context).pop();
                        setState(() {});
                      }),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        );
      },
      mini: true,
      backgroundColor: const Color(0xff4C8613).withOpacity(
        0.13,
      ),
      elevation: 0.0,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          9.r,
        ),
        borderSide: BorderSide(
          color: const Color(
            0xffFFFFFF,
          ).withOpacity(0.14),
        ),
      ),
      child: Icon(
        _event.addressModel == null ? Icons.add : Icons.edit,
        color: Theme.of(context).primaryColor,
        size: 22.r,
      ),
    );
  }
}
