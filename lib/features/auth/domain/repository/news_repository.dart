import 'package:clean_architecture/core/errors/failures.dart';
import 'package:clean_architecture/features/auth/domain/entity/news.dart';
import 'package:dartz/dartz.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<News>>> getAllNews();
  Future<Either<Failure, News>> getOneOfNewsList(String id);
}
