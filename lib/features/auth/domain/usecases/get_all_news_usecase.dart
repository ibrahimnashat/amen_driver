import 'package:clean_architecture/core/errors/failures.dart';
import 'package:clean_architecture/features/auth/domain/entity/news.dart';
import 'package:clean_architecture/features/auth/domain/repository/news_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAllNewsUseCase {
  final NewsRepository newsRepository;

  GetAllNewsUseCase({required this.newsRepository});

  Future<Either<Failure, List<News>>> getAllNews() async {
    return await newsRepository.getAllNews();
  }
}
