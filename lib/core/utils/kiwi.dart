import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/utils/dio_helper.dart';
import 'package:thimar/features/authentication/presentation/manger/confirm_code_bloc/confirm_code_bloc.dart';
import 'package:thimar/features/authentication/presentation/manger/login_bloc/login_bloc.dart';
import 'package:thimar/features/authentication/presentation/manger/register_bloc/register_bloc.dart';
import 'package:thimar/features/favourite/presentation/manger/favourite_bloc/favourite_bloc.dart';
import 'package:thimar/features/home/presentation/manger/add_cupon_bloc/add_cupon_bloc.dart';
import 'package:thimar/features/home/presentation/manger/add_product_to_cart_bloc/add_product_to_cart_bloc.dart';
import 'package:thimar/features/home/presentation/manger/category_bloc/category_bloc.dart';
import 'package:thimar/features/home/presentation/manger/catgeory_product_bloc/category_product_bloc.dart';
import 'package:thimar/features/home/presentation/manger/delete_product_cart/delete_product_bloc.dart';
import 'package:thimar/features/home/presentation/manger/get_cart_data_bloc/get_cart_data_bloc.dart';
import 'package:thimar/features/home/presentation/manger/prdouct_bloc/product_bloc.dart';
import 'package:thimar/features/home/presentation/manger/product_details_bloc/product_details_bloc.dart';
import 'package:thimar/features/home/presentation/manger/slider_bloc/slider_bloc.dart';
import 'package:thimar/features/home/presentation/manger/update_cart_bloc/update_cart_bloc.dart';
import 'package:thimar/features/notifactions_view/presentation/views/manger/notifications_bloc.dart';
import 'package:thimar/features/profile/presentation/manger/about_bloc/about_bloc.dart';
import 'package:thimar/features/profile/presentation/manger/contact_bloc/contact_bloc.dart';
import 'package:thimar/features/profile/presentation/manger/edit_pofile_bloc/edit_profile_bloc.dart';
import 'package:thimar/features/profile/presentation/manger/policy_bloc/policy_bloc.dart';
import '../../features/home/presentation/manger/address_bloc/adress_bloc.dart';
import '../../features/home/presentation/manger/get_cities/get_cities_bloc.dart';
import '../../features/home/presentation/manger/get_rates_bloc/get_rates_bloc.dart';
import '../../features/home/presentation/manger/orders/orders_bloc.dart';
import '../../features/profile/presentation/manger/logout_bloc/logout_bloc.dart';

void initKiwi(){
KiwiContainer container =KiwiContainer();
container.registerInstance((container)=> DioHelper());
container.registerFactory((container) => LoginBloc());
container.registerFactory((container) => RegisterBloc());
container.registerFactory((container) => ConfirmCodeBloc());
container.registerFactory((container) => SliderBloc());
container.registerFactory((container) => CategoryBloc());
container.registerFactory((container) => CategoryProductBloc());
container.registerFactory((container)=> ProductBloc());
container.registerFactory((container)=>ProductDetailsBloc());
container.registerFactory((container) => GetRatesBloc());
container.registerFactory((container) => FavouriteBloc());
container.registerFactory((container) => PolicyBloc());
container.registerFactory((container) => AboutBloc());
container.registerFactory((container) => LogoutBloc());
container.registerFactory((container) => ContactBloc());
container.registerFactory((container) => EditProfileBloc());
container.registerFactory((container) => AddProductToCartBloc());
container.registerFactory((container) => GetCartDataBloc());
container.registerFactory((container) => UpdateCartBloc());
container.registerFactory((container) => DeleteProductBloc());
container.registerFactory((container) => AddCouponBloc());
container.registerFactory((c) => CitiesBloc());
container.registerFactory((c) => AddressBloc());
container.registerFactory((c) => OrdersBloc());
container.registerFactory((container) => NotificationsBloc());




}