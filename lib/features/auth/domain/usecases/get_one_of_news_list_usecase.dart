import 'package:clean_architecture/core/errors/failures.dart';
import 'package:clean_architecture/features/auth/domain/entity/news.dart';
import 'package:clean_architecture/features/auth/domain/repository/news_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetOneOfNewsListUseCase {
  final NewsRepository newsRepository;

  GetOneOfNewsListUseCase({required this.newsRepository});

  Future<Either<Failure, News>> getOneOfNewsList(String id) async {
    return await newsRepository.getOneOfNewsList(id);
  }
}
