import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/features/home/presentation/views/widgets/rating_widget.dart';

import '../../manger/get_rates_bloc/get_rates_bloc.dart';
class RatingListView extends StatefulWidget {
  const RatingListView({super.key, required this.id});
final int id ;

  @override
  State<RatingListView> createState() => _RatingListViewState();
}

class _RatingListViewState extends State<RatingListView> {
  final getRatesBloc = KiwiContainer().resolve<GetRatesBloc>();
@override
  void initState() {
    super.initState();
    getRatesBloc.add(GetProductRatingEvent(id: widget.id));
  }
  @override
  void dispose() {
    super.dispose();
    // TODO: implement dispose
    getRatesBloc.close();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(bloc:  getRatesBloc,builder: (context,state){
      if(state is GetRatesLoading){
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      else if( state is GetRatesSuccess){
        return  ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.list.length,
            itemBuilder: (context,index){
              return  RatingWidget(ratingData: state.list[index],);
            });
      }
      else{
        return SizedBox();
      }

    });
  }
}
