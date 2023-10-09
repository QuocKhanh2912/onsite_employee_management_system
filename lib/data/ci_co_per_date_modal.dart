import 'package:onsite_employee_management_system/data/attendance_data_modal.dart';
import 'package:onsite_employee_management_system/data/early_leavers-modal.dart';
import 'package:onsite_employee_management_system/data/late_comer_modal.dart';
import 'package:onsite_employee_management_system/data/mock_data_user_modal.dart';

class CiCoPerDateModal {
  List<AttendanceDataModal>? participants;
  List<LateComerModal>? lateComers;
  List<EarlyLeaverModal>? earlyLeavers;

  CiCoPerDateModal({this.participants, this.lateComers, this.earlyLeavers});

  static CiCoPerDateModal sep202003 = CiCoPerDateModal(participants: [
    AttendanceDataModal(
        attendanceDataId: 123456,
        participant: MockDataUserModal.ratul,
        inTime: '07:55 AM',
        outTime: '05:05 PM'),
    AttendanceDataModal(
        attendanceDataId: 123456,
        participant: MockDataUserModal.mobussharIslam,
        inTime: '08:05 AM'),
    AttendanceDataModal(
        attendanceDataId: 123456,
        participant: MockDataUserModal.milon,
        inTime: '07:55 AM',
        outTime: '05:01 PM'),
    AttendanceDataModal(
        attendanceDataId: 123456,
        participant: MockDataUserModal.ratul,
        outTime: '04:01 PM'),
    AttendanceDataModal(
        attendanceDataId: 123456,
        participant: MockDataUserModal.sorif,
        inTime: '07:55 AM',
        outTime: '05:01 PM'),
    AttendanceDataModal(
        attendanceDataId: 123456,
        participant: MockDataUserModal.ratul,
    ),
  ], earlyLeavers: [
    EarlyLeaverModal(
        earlyLeaver: MockDataUserModal.milon, timeIn: '03:30 PM', lateBy: '01:30'),
    EarlyLeaverModal(
        earlyLeaver: MockDataUserModal.sorif, timeIn: '04:34 PM', lateBy: '00:26'),
    EarlyLeaverModal(
        earlyLeaver: MockDataUserModal.sorif, timeIn: '04:34 PM', lateBy: '00:26'),
    EarlyLeaverModal(
        earlyLeaver: MockDataUserModal.sorif, timeIn: '04:34 PM', lateBy: '00:26'),
  ], lateComers: [
    LateComerModal(
        lateComer: MockDataUserModal.milon, timeIn: '08:15 AM', lateBy: '00:15'),
    LateComerModal(
        lateComer: MockDataUserModal.milon, timeIn: '08:15 AM', lateBy: '00:15'),
    LateComerModal(
        lateComer: MockDataUserModal.milon, timeIn: '08:15 AM', lateBy: '00:15'),
  ]);
}
