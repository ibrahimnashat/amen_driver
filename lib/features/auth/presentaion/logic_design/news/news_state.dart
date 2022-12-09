// ignore_for_file: must_be_immutable

part of 'news_bloc.dart';

abstract class NewsState extends Equatable {}

class InitialNewsList extends NewsState {
  @override
  List<Object?> get props => [];
}

class GetAllNewsList extends NewsState {
  List<News> listOfNews;
  GetAllNewsList({required this.listOfNews});
  @override
  List<Object?> get props => [listOfNews];
}

class GetOneOfNewsListState extends NewsState {
  News news;
  GetOneOfNewsListState({required this.news});
  @override
  List<Object?> get props => [news];
}
