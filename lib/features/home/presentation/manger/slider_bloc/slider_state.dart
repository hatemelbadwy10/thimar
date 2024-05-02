

import 'package:thimar/features/home/data/models/slider_model.dart';

sealed class SliderState {}

final class SliderInitial extends SliderState {}
final class SliderSuccess extends SliderState{
  final List<Data> data;

  SliderSuccess({required this.data});
}
final class SliderFailure extends SliderState{}
final class SliderLoading extends SliderState{}
