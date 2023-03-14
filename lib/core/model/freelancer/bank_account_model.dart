class BankAccountModel{
  BankAccountModel({required this.accountFullName, required this.accountNumber, required this.branch, required this.ledger, this.isSelected = false});
  final String accountFullName;
  final String accountNumber;
  final String branch;
  final String ledger;
   bool isSelected;

}