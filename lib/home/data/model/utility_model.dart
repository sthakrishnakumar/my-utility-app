class UtilityModel {
  final String hris;
  final String workReport;
  UtilityModel({
    required this.hris,
    required this.workReport,
  });

  factory UtilityModel.fromJson(Map<String, dynamic> json) {
    return UtilityModel(
      hris: json['hris'] ?? "",
      workReport: json['work_report'] ?? "",
    );
  }
}
