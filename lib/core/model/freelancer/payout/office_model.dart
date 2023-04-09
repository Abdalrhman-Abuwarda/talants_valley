class OfficeModel {
  OfficeModel._(
      {required this.id,
      required this.name,
      required this.address,
      required this.fees,
      required this.endingHour,
      required this.startingHour,
      this.isSelected = false});

  final String id;
  final String name;
  final String address;
  final String fees;
  final String endingHour;
  final String startingHour;
  bool isSelected;

  factory OfficeModel.fromJson(Map<String, dynamic> json) => OfficeModel._(
      id: json["_id"],
      name: json["name"],
      address: json["address"],
      fees: json["fees"],
      endingHour: json["endingHour"],
      startingHour: json["startingHour"],

  );
}
