// ignore_for_file: must_be_immutable

part of 'news_bloc.dart';

abstract class SignUpEvent extends Equatable {}

class GetOneOfNewsListEvent extends SignUpEvent {
  String id;
  GetOneOfNewsListEvent({required this.id});
  @override
  List<Object?> get props => [id];
}

class GetAllNewsListEvent extends SignUpEvent {
  @override
  List<Object?> get props => [];
}
