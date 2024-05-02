import 'package:bloc/bloc.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
part 'count_down_state.dart';
class CountDownCubit extends Cubit<CountDownState> {
  CountDownCubit() : super(CountDownInitial());
  final CountDownController controller = CountDownController();
  final int _duration = 4;
 bool timerStarted = true;
  bool buttonEnabled = false;

  void startCount(){
    controller.start();
    controller.restart(duration: _duration);
    timerStarted = true;
    buttonEnabled= false;
    emit(CountDownStart());
  }
}

