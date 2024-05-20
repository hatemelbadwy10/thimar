import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/features/home/presentation/manger/counter_cubit/counter_cubit.dart';
import 'package:thimar/features/home/presentation/manger/product_details_bloc/product_details_bloc.dart';
import 'package:thimar/features/home/presentation/views/widgets/icon_widget.dart';
class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key,  this.height,  this.width, this.iconWidth, this.iconHeight,  this.iconSize, this.color,this.counter});
  final double? height;
  final double? width;
  final double? iconWidth;
  final double? iconHeight;
  final double? iconSize;
  final Color? color;
  final int? counter;

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  final bloc = KiwiContainer().resolve<ProductDetailsBloc>();

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<CounterCubit,int>(

      builder: (BuildContext context, state) {
      return Container(
        width: widget.width?? 120.w,
        height: widget.height?? 40.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: widget.color?? Theme.of(context).colorScheme.primaryContainer
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconWidget(
                  height:widget.iconHeight?? 29.h,
                  width:widget.iconWidth?? 29.w,
                  icon:  Icon(FontAwesomeIcons.plus,
                  size: widget.iconSize??18,
                  color: Theme.of(context).colorScheme.primary,
                  ), onPress: (){
                BlocProvider.of<CounterCubit>(context).increment();

              },
                  color: Colors.white
              ),
               Text('${widget.counter}',
               style: Styles.textStyle10,
               ),
              IconWidget(
          height:29.h,
          width:29.w,
          icon:  Icon(FontAwesomeIcons.minus,
              size: widget.iconSize??18,
              color: Theme.of(context).colorScheme.primary,
          ), onPress: (){
            if(state==1) {
return null;
            }
            else{
              BlocProvider.of<CounterCubit>(context).sub();

            }
              },
                color: Colors.white,)
            ],

          ),
        ),
      );

    },

    );
  }
}
