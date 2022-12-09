import 'package:clean_architecture/core/consts/exports.dart';
import 'package:clean_architecture/features/auth/data/data_source/remote_data_source.dart'
    as rd;
import 'package:dio/dio.dart' as di;
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  await getIt.init(environment: 'dev').addPackagesInit();
}

extension AddPackagesToGetIt on GetIt {
  Future<GetIt> addPackagesInit() async {
    final gt = GetItHelper(this);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    di.Dio dio = di.Dio(di.BaseOptions(contentType: "application/json"));
    gt.factory<SharedPreferences>(() => sharedPreferences);
    gt.factory<di.Dio>(() => dio);
    gt.factory<rd.RemoteDataSource>(() => rd.RemoteDataSource(gt<di.Dio>()));
    return this;
  }
}
