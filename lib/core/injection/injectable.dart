import 'package:amen_driver/core/consts/exports.dart';
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
    gt.factory<SharedPreferences>(() => sharedPreferences);
    return this;
  }
}
