import 'package:amen_driver/core/consts/exports.dart';
import 'package:amen_driver/features/auth/presentaion/view/sign_up/sign_up_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(StartScreenState()) {
    on<SplashEvent>((event, emit) {
      if (event is StartScreenEvent) {
        Future.delayed(const Duration(seconds: 3), () {
          event.context.pushAndRemoveUntil(const SignUpScreen());
        });
      }
    });
  }
}
