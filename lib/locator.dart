import 'package:get_it/get_it.dart';
import 'package:talants_valley/core/data/repository/auth_and_verification_repo/auth_repo.dart';
import 'package:talants_valley/core/data/repository/auth_and_verification_repo/verification_repo.dart';
import 'package:talants_valley/core/data/repository/team_repo/user_mangement_repo.dart';
import 'package:talants_valley/ui/teamPages/activites/core_activity/activiyt_data/activity_repo/activity_repo.dart';
import 'package:talants_valley/ui/teamPages/home/team_home_core/team_dashboard_repo/team_dashboard_repo.dart';
import 'package:talants_valley/ui/teamPages/notification_team/notification_team_core/notification_team_data/notification_team_repo.dart';

import 'core/data/network/api/dio_client.dart';
import 'core/data/repository/freelancer_repo/payout_freelancer_repo.dart';

final locator = GetIt.instance;

void setup(){
  locator.registerLazySingleton<DioClient>(() => DioClient());
  locator.registerLazySingleton<PayoutFreelancerRepo>(() => PayoutFreelancerRepo());
  locator.registerLazySingleton<VerificationRepo>(() => VerificationRepo());
  locator.registerLazySingleton<AuthRepo>(() => AuthRepo(locator<DioClient>()));
  locator.registerLazySingleton<UserManagementRepo>(() => UserManagementRepo());
  locator.registerLazySingleton<ActivityRepo>(() => ActivityRepo());
  locator.registerLazySingleton<NotificationTeamRepo>(() => NotificationTeamRepo());
  locator.registerLazySingleton<TeamDashboardRepo>(() => TeamDashboardRepo());
}
