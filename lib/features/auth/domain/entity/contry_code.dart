import 'package:equatable/equatable.dart';

class CountryCode extends Equatable {
  final String name;
  final String flag;
  const CountryCode({
    required this.flag,
    required this.name,
  });

  @override
  List<Object?> get props => [name, flag];
}
