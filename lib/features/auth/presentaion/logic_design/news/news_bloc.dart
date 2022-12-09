import 'dart:developer';
import 'package:clean_architecture/features/auth/domain/entity/news.dart';
import 'package:clean_architecture/features/auth/domain/usecases/get_one_of_news_list_usecase.dart';
import 'package:clean_architecture/features/auth/domain/usecases/get_all_news_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'news_event.dart';
part 'news_state.dart';

@injectable
class NewsBloc extends Bloc<SignUpEvent, NewsState> {
  final GetOneOfNewsListUseCase getOneOfNewsListUseCase;
  final GetAllNewsUseCase getAllNewsUseCase;
  NewsBloc({
    required this.getOneOfNewsListUseCase,
    required this.getAllNewsUseCase,
  }) : super(InitialNewsList()) {
    on<SignUpEvent>((event, emit) async {
      if (event is GetAllNewsListEvent) {
        final listOfNewsOrFailure = await getAllNewsUseCase.getAllNews();
        listOfNewsOrFailure.fold(
          (failure) => log(failure.runtimeType.toString()),
          (listOfNews) {
            log(listOfNews.length.toString());
            emit(GetAllNewsList(listOfNews: listOfNews));
          },
        );
      } else if (event is GetOneOfNewsListEvent) {
        final newsOrFailure =
            await getOneOfNewsListUseCase.getOneOfNewsList(event.id);
        newsOrFailure.fold(
          (failure) => log(failure.runtimeType.toString()),
          (news) {
            emit(GetOneOfNewsListState(news: news));
          },
        );
      }
    });
  }
}
