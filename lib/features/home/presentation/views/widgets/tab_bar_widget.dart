import'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/features/home/presentation/views/widgets/order_widget.dart';
class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>  with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();

    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          height: kToolbarHeight - 8.0 ,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40)
          ),
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
                  child: Text('الحاليه',
                  style: Styles.textStyle15,
                  ),
                ),
              ),
              SizedBox(
                width: 165,
                child: Center(
                  child: Text('المنتهية',
                    style: Styles.textStyle15,

                  ),
                ),
              ),
            ],

          ),

        ),
        Expanded(
          child:  TabBarView(
            controller: tabController,
              children: [
                Expanded(
                  child: ListView.builder(itemBuilder: (index , context){
                    return const OrderWidget(status: 'in_progress',);
                  }),
                ),
              ListView.builder(itemBuilder: (index,context){
                return const OrderWidget(status:'finished' );
              }
              )
              ]
          ),
        )
      ],
    );

  }

}
