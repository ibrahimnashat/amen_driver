import 'package:clean_architecture/features/auth/data/models/list_of_news_response_model.dart';
import 'package:clean_architecture/features/auth/data/models/one_of_news_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'remote_data_source.g.dart';

@RestApi(baseUrl: "https://api.first.org/data/v1")
abstract class RemoteDataSource {
  factory RemoteDataSource(Dio dio, {String baseUrl}) = _RemoteDataSource;
  @GET('/news')
  Future<ListOfNewsResponseModel> getAllNews();
  //get one of news cann't loaded bequase api need access key. that is private api.
  @GET('/news/{id}')
  Future<OneOfNewsResponseModel> getOneOfNewsList(@Path("id") String id);
}
