import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/features/home/presentation/views/widgets/product_description_view_body.dart';

import '../manger/counter_cubit/counter_cubit.dart';

class ProductDescriptionView extends StatelessWidget {
  const ProductDescriptionView({super.key, required this.id, required this.isFavourite});
final bool isFavourite;
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: Scaffold(
        body: ProductDescriptionViewBody(id: id, isFavourite: isFavourite,),
      ),
    );
  }
}
