import 'package:onsite_employee_management_system/data/office/office_modal.dart';

class UserDataModel {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int userId;
  final int officeId;
  final OfficeDataModel office;
  final String status;
  final DateTime checkedInAt;
  final DateTime checkedOutAt;
  final String lateReason;
  final String earlyReason;

  UserDataModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.officeId,
    required this.office,
    required this.status,
    required this.checkedInAt,
    required this.checkedOutAt,
    required this.lateReason,
    required this.earlyReason,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'user_id': userId,
      'office_id': officeId,
      'office': office.toJson(),
      'status': status,
      'checked_in_at': checkedInAt.toIso8601String(),
      'checked_out_at': checkedOutAt.toIso8601String(),
      'late_reason': lateReason,
      'early_reason': earlyReason,
    };
  }

  static UserDataModel fromJson(Map<String, dynamic> json) {
    final officeJson = json['Office'] as Map<String, dynamic>?;
    return UserDataModel(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      userId: json['user_id'],
      officeId: json['office_id'],
      office: officeJson != null
          ? OfficeDataModel.fromJson(officeJson)
          : OfficeDataModel.officeDataModelNull,
      status: json['status'],
      checkedInAt: DateTime.parse(json['checked_in_at']),
      checkedOutAt: DateTime.parse(json['checked_out_at']),
      lateReason: json['late_reason'] ?? '',
      earlyReason: json['early_reason'] ?? '',
    );
  }
}
