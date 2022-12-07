part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {}

class SetCountryCodeEvent extends SignUpEvent {
  final BuildContext context;

  SetCountryCodeEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class DefaultCountryCodeEvent extends SignUpEvent {
  final BuildContext context;

  DefaultCountryCodeEvent({required this.context});
  @override
  List<Object?> get props => [context];
}
