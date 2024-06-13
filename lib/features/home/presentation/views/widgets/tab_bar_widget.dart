import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/features/home/presentation/manger/orders/orders_bloc.dart';
import 'package:thimar/features/home/presentation/manger/orders/orders_state.dart';
import 'package:thimar/features/home/presentation/views/widgets/order_widget.dart';
import 'package:thimar/features/home/presentation/views/widgets/shimmer_widget.dart';

import '../../manger/orders/orders_event.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

final bloc = KiwiContainer().resolve<OrdersBloc>();

class _TabBarWidgetState extends State<TabBarWidget>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    bloc.add(GetOrdersDataEvent(type: 'current'));
tabController.addListener( (){
  bloc.add(GetOrdersDataEvent(
      type:
      endPoints[tabController.index]

  ));
});

  }
final endPoints =['current','finished'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: kToolbarHeight - 8.0,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
          child: TabBar(
            controller: tabController,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).colorScheme.primary,
            ),
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.white,
            tabs: [
              SizedBox(
                width: 200.w,
                child: Center(
                  child: Text(
                    'الحاليه',
                    style: Styles.textStyle15,
                  ),
                ),
              ),
              SizedBox(
                width: 165,
                child: Center(
                  child: Text(
                    'المنتهية',
                    style: Styles.textStyle15,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child:  BlocBuilder(
            bloc: bloc,
  builder: (context, state) {
   if(state is GetOrdersDataLoadingState){
     return ShimmerWidget();

   }
   else if(state is GetOrdersDataSuccessState){
     return TabBarView(
         controller: tabController,
         children: [
          state.data.isEmpty?Center(child: Text('لا يوجد طلبات',
          style: Styles.textStyle30,
          )): ListView.builder(
               itemCount: state.data.length,
               itemBuilder: (context , index){
             return  OrderWidget( orderDetailsModel: state.data[index],);
           }),
           state.data.isEmpty?Center(child: Text('لا يوجد طلبات',
             style: Styles.textStyle30,
           )):  ListView.builder(
               itemCount: state.data.length,
               itemBuilder: (context,index){
             return  OrderWidget( orderDetailsModel:state.data[index] , );
           }
           )
         ]
     );
   }
   else{
     return SizedBox();
   }
  },
),
        )
      ],
    );
  }
}
