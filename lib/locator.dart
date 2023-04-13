import 'package:get_it/get_it.dart';

import 'core/data/network/api/dio_client.dart';
import 'core/data/repository/freelancer_repo/payout_freelancer_repo.dart';

final locator = GetIt.instance;

void setup(){
  locator.registerLazySingleton<PayoutFreelancerRepo>(() => PayoutFreelancerRepo());
  locator.registerLazySingleton<DioClient>(() => DioClient());
  // locator.registerLazySingleton<DioInterceptor>(() => DioInterceptor());
}