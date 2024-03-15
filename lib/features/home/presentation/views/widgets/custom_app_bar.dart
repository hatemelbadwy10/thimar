import 'package:flutter/material.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/features/home/presentation/views/widgets/cart_widget.dart';
import 'package:thimar/features/home/presentation/views/widgets/thimir_text.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return    const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ThimarText(),
        AddressDropDown(),
        CartWidget()



      ],
    );
  }
}
class AddressDropDown extends StatelessWidget {
  const AddressDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        Text('التوصيل الي',
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
      //   DropdownButton<String>(
      //
    //     items: <String>['A', 'B', 'C', 'D'].map((String value) {
      //       return DropdownMenuItem<String>(
      //         value: value,
      //         child: Text(value),
      //       );
      //     }).toList(),
      //     onChanged: (_) {},
      //   ),
      //
    // 
        Text('شارع الملك فهد - جدة')
    ],
    );
  }
}
