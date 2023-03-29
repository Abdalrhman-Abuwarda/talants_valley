import 'package:get_it/get_it.dart';

import 'core/data/network/dioInterceptor.dart';
import 'core/data/repository/freelancer/payout_freelancer_repo.dart';

final locator = GetIt.instance;

void setup(){
  locator.registerLazySingleton<PayoutFreelancerRepo>(() => PayoutFreelancerRepo());
  locator.registerLazySingleton<DioInterceptor>(() => DioInterceptor());
}