part of 'splash_bloc.dart';

abstract class SplashState extends Equatable {}

class StartScreenState extends SplashState {
  final List<Map<String, dynamic>> logoParts = [
    {"title": "Amen transportation has", "start": -200.0},
    {"title": "become safe", "start": 200.0},
  ];
  @override
  List<Object?> get props => [logoParts];
}
