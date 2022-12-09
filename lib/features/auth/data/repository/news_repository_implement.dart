import 'package:clean_architecture/core/errors/exceptions.dart';
import 'package:clean_architecture/features/auth/data/data_source/remote_data_source.dart';
import 'package:clean_architecture/features/auth/domain/entity/news.dart';
import 'package:clean_architecture/core/errors/failures.dart';
import 'package:clean_architecture/features/auth/domain/repository/news_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: NewsRepository)
class NewsRepositoryImplement implements NewsRepository {
  final RemoteDataSource remoteDataSource;

  NewsRepositoryImplement({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<News>>> getAllNews() async {
    try {
      final listOfNews = await remoteDataSource.getAllNews();
      return Right(listOfNews.data);
    } catch (e) {
      return Left(CountryCodeFailure());
    }
  }

  @override
  Future<Either<Failure, News>> getOneOfNewsList(String id) async {
    try {
      final news = await remoteDataSource.getOneOfNewsList(id);
      return Right(news.data);
    } on CountryCodeException {
      return Left(CountryCodeFailure());
    }
  }
}
