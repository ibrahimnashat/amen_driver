part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {}

class InitalCountryCode extends SignUpState {
  @override
  List<Object?> get props => [];
}

class HasCountryCodeState extends SignUpState {
  final CountryCode countryCode;

  HasCountryCodeState({required this.countryCode});
  @override
  List<Object?> get props => [countryCode];
}
