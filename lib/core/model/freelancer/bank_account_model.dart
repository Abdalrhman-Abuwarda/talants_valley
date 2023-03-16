class SecondBankModel{
  SecondBankModel({required this.accountFullName, required this.accountNumber, required this.bankBranch, required this.ledger, this.isSelected = false, this.bankName = "Palestine"});
  final String accountFullName;
  final String accountNumber;
  final String bankBranch;
  final String ledger;
  final String bankName;
  bool isSelected;

}