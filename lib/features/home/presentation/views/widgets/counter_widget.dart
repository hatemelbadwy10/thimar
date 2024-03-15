import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thimar/features/home/manger/counter_cubit/counter_cubit.dart';
import 'package:thimar/features/home/presentation/views/widgets/icon_widget.dart';
class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key,  this.height,  this.width, this.iconWidth, this.iconHeight,  this.iconSize, this.color});
  final double? height;
  final double? width;
  final double? iconWidth;
  final double? iconHeight;
  final double? iconSize;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<CounterCubit,int>(
      builder: (BuildContext context, state) {
      return Container(
        width: width?? 120.w,
        height: height?? 40.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: color?? Theme.of(context).colorScheme.primaryContainer
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconWidget(
                  height:iconHeight?? 29.h,
                  width:iconWidth?? 29.w,
                  icon:  Icon(FontAwesomeIcons.plus,
                  size: iconSize??18,
                  color: Theme.of(context).colorScheme.primary,
                  ), onPress: (){
                BlocProvider.of<CounterCubit>(context).increment();

              },
                  color: Colors.white
              ),
               Text('$state'),
              IconWidget(
          height:29.h,
          width:29.w,
          icon:  Icon(FontAwesomeIcons.minus,
              size: iconSize??18,
              color: Theme.of(context).colorScheme.primary,
          ), onPress: (){
            if(state ==1) {
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
