class WithdrawalModel {
  WithdrawalModel({required this.status , required this.createdAt , required this.balance , required this.fees , required this.freelancerName , required this.withdrawalFrom});
  final String freelancerName;
  final String withdrawalFrom;
  final String balance;
  final String createdAt;
  final String fees;
  final String status;

}