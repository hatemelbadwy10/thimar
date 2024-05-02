import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/utils/dio_helper.dart';
import 'package:thimar/features/authentication/presentation/manger/login_bloc/login_bloc.dart';
import 'package:thimar/features/authentication/presentation/manger/register_bloc/register_bloc.dart';
import 'package:thimar/features/home/presentation/manger/category_bloc/category_bloc.dart';
import 'package:thimar/features/home/presentation/manger/catgeory_product_bloc/category_product_bloc.dart';
import 'package:thimar/features/home/presentation/manger/prdouct_bloc/product_bloc.dart';
import 'package:thimar/features/home/presentation/manger/product_details_bloc/product_details_bloc.dart';
import 'package:thimar/features/home/presentation/manger/slider_bloc/slider_bloc.dart';

import '../../features/home/presentation/manger/get_rates_bloc/get_rates_bloc.dart';

void initKiwi(){
KiwiContainer container =KiwiContainer();
container.registerInstance((c)=> DioHelper());
container.registerFactory((c) => LoginBloc());
container.registerFactory((c) => RegisterBloc());
container.registerFactory((c) => SliderBloc());
container.registerFactory((c) => CategoryBloc());
container.registerFactory((c) => CategoryProductBloc());
container.registerFactory((c)=> ProductBloc());
container.registerFactory((c)=>ProductDetailsBloc());
container.registerFactory((c) => GetRatesBloc());

}