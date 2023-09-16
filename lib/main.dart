import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onsite_employee_management_system/routes/routes_management.dart';
import 'package:onsite_employee_management_system/utils/observing_bloc.dart';

import 'bloc/ci_co_bloc/ci_co_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CiCoBloc(),
      child: MaterialApp.router(
        theme: ThemeData(fontFamily: 'Roboto', useMaterial3: true),
        routerConfig: RoutesManagement.routes,
      ),
    );
  }
}
