class RecipientModel {
  RecipientModel._(
      {required this.id,
      required this.name,
      required this.updatedAt,
      required this.createdAt,
      required this.idNumber,
      required this.mobile,
      this.isSelected = false});

  final String? id;
  final String name;
  final String mobile;
  final String idNumber;
  final String? createdAt;
  final String? updatedAt;
  bool isSelected;

  factory RecipientModel.fromJson(Map<String, dynamic> json) =>
      RecipientModel._(
          id: json["_id"],
          name: json["name"],
          updatedAt: json["updatedAt"],
          createdAt: json["createdAt"],
          idNumber: json["idNumber"] ?? "",
          mobile: json["mobile"]);
}
