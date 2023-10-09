class OfficeDataModel {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final double longitude;
  final double latitude;
  final String startWorkingTime;
  final String endWorkingTime;
  final int beLateAfter;
  final int beEarlyBefore;

  OfficeDataModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.longitude,
    required this.latitude,
    required this.startWorkingTime,
    required this.endWorkingTime,
    required this.beLateAfter,
    required this.beEarlyBefore,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'name': name,
      'longitude': longitude,
      'latitude': latitude,
      'start_working_time': startWorkingTime,
      'end_working_time': endWorkingTime,
      'be_late_after': beLateAfter,
      'be_early_before': beEarlyBefore,
    };
  }
  static OfficeDataModel fromJson(Map<String, dynamic> json) {
    return OfficeDataModel(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      name: json['name'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      startWorkingTime: json['start_working_time'],
      endWorkingTime: json['end_working_time'],
      beLateAfter: json['be_late_after'],
      beEarlyBefore: json['be_early_before'],
    );
  }
  static OfficeDataModel officeDataModelNull =OfficeDataModel(
    id: -1,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    name: '',
    longitude: 0.0,
    latitude: 0.0,
    startWorkingTime: '',
    endWorkingTime: '',
    beLateAfter: 0,
    beEarlyBefore: 0,
  );
}