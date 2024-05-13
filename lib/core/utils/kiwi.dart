import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/utils/dio_helper.dart';
import 'package:thimar/features/authentication/presentation/manger/login_bloc/login_bloc.dart';
import 'package:thimar/features/authentication/presentation/manger/register_bloc/register_bloc.dart';
import 'package:thimar/features/favourite/presentation/manger/favourite_bloc/favourite_bloc.dart';
import 'package:thimar/features/home/presentation/manger/add_product_to_cart_bloc/add_product_to_cart_bloc.dart';
import 'package:thimar/features/home/presentation/manger/category_bloc/category_bloc.dart';
import 'package:thimar/features/home/presentation/manger/catgeory_product_bloc/category_product_bloc.dart';
import 'package:thimar/features/home/presentation/manger/prdouct_bloc/product_bloc.dart';
import 'package:thimar/features/home/presentation/manger/product_details_bloc/product_details_bloc.dart';
import 'package:thimar/features/home/presentation/manger/slider_bloc/slider_bloc.dart';
import 'package:thimar/features/profile/presentation/manger/about_bloc/about_bloc.dart';
import 'package:thimar/features/profile/presentation/manger/contact_bloc/contact_bloc.dart';
import 'package:thimar/features/profile/presentation/manger/edit_pofile_bloc/edit_profile_bloc.dart';
import 'package:thimar/features/profile/presentation/manger/policy_bloc/policy_bloc.dart';

import '../../features/home/presentation/manger/get_rates_bloc/get_rates_bloc.dart';
import '../../features/profile/presentation/manger/logout_bloc/logout_bloc.dart';

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
container.registerFactory((c) => FavouriteBloc());
container.registerFactory((c) => PolicyBloc());
container.registerFactory((container) => AboutBloc());
container.registerFactory((container) => LogoutBloc());
container.registerFactory((container) => ContactBloc());
container.registerFactory((container) => EditProfileBloc());
container.registerFactory((container) => AddProductToCartBloc());


}