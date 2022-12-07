import 'dart:developer';

import 'package:amen_driver/core/consts/exports.dart';
import 'package:amen_driver/core/errors/failures.dart';
import 'package:amen_driver/features/auth/domain/entity/contry_code.dart';
import 'package:amen_driver/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

@injectable
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository authRepository;
  SignUpBloc({required this.authRepository}) : super(InitalCountryCode()) {
    on<SignUpEvent>((event, emit) async {
      if (event is DefaultCountryCodeEvent) {
        await _onInitialCountryCode(
          context: event.context,
          emit: emit,
        );
      } else if (event is SetCountryCodeEvent) {
        await _onShowPickerCountryCode(
          context: event.context,
          emit: emit,
        );
      }
    });
  }

  Future<void> _onInitialCountryCode({
    required BuildContext context,
    required Emitter emit,
  }) async {
    final countryCodeOrFailure =
        await authRepository.defaultCountryCodePicker(context: context);
    _afterChooseCountryCode(
      countryCodeOrFailure: countryCodeOrFailure,
      emit: emit,
    );
  }

  Future<void> _onShowPickerCountryCode({
    required BuildContext context,
    required Emitter emit,
  }) async {
    final countryCodeOrFailure =
        await authRepository.showCountryCodePicker(context: context);
    _afterChooseCountryCode(
      countryCodeOrFailure: countryCodeOrFailure,
      emit: emit,
    );
  }

  Future<void> _afterChooseCountryCode({
    required Either<Failure, CountryCode> countryCodeOrFailure,
    required Emitter emit,
  }) async {
    countryCodeOrFailure.fold(
      (failure) => log(failure.runtimeType.toString()),
      (countryCode) {
        emit(HasCountryCodeState(countryCode: countryCode));
      },
    );
  }
}
