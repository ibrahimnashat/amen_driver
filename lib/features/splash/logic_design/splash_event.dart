part of 'splash_bloc.dart';

abstract class SplashEvent extends Equatable {}

class StartScreenEvent extends SplashEvent {
  final BuildContext context;

  StartScreenEvent({required this.context});
  @override
  List<Object?> get props => [context];
}
