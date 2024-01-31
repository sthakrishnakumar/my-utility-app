// ignore_for_file: public_member_api_docs, sort_constructors_first
class UtilityModel {
  final List<Utilities> utilities;

  UtilityModel({
    required this.utilities,
  });

  factory UtilityModel.fromJson(Map<String, dynamic> json) {
    return UtilityModel(
      utilities: List.from(json["data"] ?? [])
          .map(
            (e) => Utilities.fromJson(e ?? {}),
          )
          .toList(),
    );
  }
}

class Utilities {
  final String key;
  final String value;
  Utilities({
    required this.key,
    required this.value,
  });

  factory Utilities.fromJson(Map<String, dynamic> json) {
    return Utilities(
      key: json['key'] ?? "",
      value: json['value'] ?? "",
    );
  }
}
