import 'package:get_it/get_it.dart';
import 'package:talants_valley/core/data/repository/auth_and_verification_repo/auth_repo.dart';
import 'package:talants_valley/core/data/repository/auth_and_verification_repo/verification_repo.dart';

import 'core/data/network/api/dio_client.dart';
import 'core/data/repository/freelancer_repo/payout_freelancer_repo.dart';

final locator = GetIt.instance;

void setup(){
  locator.registerLazySingleton<PayoutFreelancerRepo>(() => PayoutFreelancerRepo());
  locator.registerLazySingleton<VerificationRepo>(() => VerificationRepo());
  locator.registerLazySingleton<AuthRepo>(() => AuthRepo());
  locator.registerLazySingleton<DioClient>(() => DioClient());
  // locator.registerLazySingleton<DioInterceptor>(() => DioInterceptor());
}