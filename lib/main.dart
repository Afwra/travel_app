import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/business_logic/app_cubit.dart';
import 'package:travel_app/business_logic/app_cubit_logic.dart';
import 'business_logic/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      home: BlocProvider(
        create: (context) => AppCubit(),
        child:  AppCubitLogic(),
      ),
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
    );
  }
}
