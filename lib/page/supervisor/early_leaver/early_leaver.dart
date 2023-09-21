import 'package:flutter/material.dart';
import 'package:onsite_employee_management_system/data/ci_co_per_date_modal.dart';
import 'package:onsite_employee_management_system/page/supervisor/component/frame_page_custom.dart';

class EarlyLeaverPage extends StatefulWidget {
  const EarlyLeaverPage({super.key});

  @override
  State<EarlyLeaverPage> createState() => _EarlyLeaverPageState();
}

class _EarlyLeaverPageState extends State<EarlyLeaverPage> {
  @override
  Widget build(BuildContext context) {
    return FramePageCustom(
      showUserId: false,
      appBarName: 'Early Leavers',
      listEarlyLeavers: CiCoPerDateModal.sep202003.earlyLeavers,
    );
  }
}
