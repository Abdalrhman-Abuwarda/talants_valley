import 'package:get_it/get_it.dart';

import 'core/data/network/api/dio_interceptor.dart';
import 'core/data/repository/freelancer_repo/payout_freelancer_repo.dart';

final locator = GetIt.instance;

void setup(){
  locator.registerLazySingleton<PayoutFreelancerRepo>(() => PayoutFreelancerRepo());
  locator.registerLazySingleton<DioInterceptor>(() => DioInterceptor());
}