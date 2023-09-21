import 'package:flutter/material.dart';
import 'package:onsite_employee_management_system/data/ci_co_per_date_modal.dart';
import 'package:onsite_employee_management_system/page/supervisor/component/frame_page_custom.dart';

class LateComerPage extends StatefulWidget {
  const LateComerPage({super.key});

  @override
  State<LateComerPage> createState() => _LateComerPageState();
}

class _LateComerPageState extends State<LateComerPage> {
  @override
  Widget build(BuildContext context) {
    return FramePageCustom(
      showUserId: false,
      listLateComers: CiCoPerDateModal.sep202003.lateComers,
      appBarName: 'Late Comers',
    );
  }
}
