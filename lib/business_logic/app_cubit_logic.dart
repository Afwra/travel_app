import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/business_logic/app_cubit.dart';
import 'package:travel_app/pages/details_page.dart';
import 'package:travel_app/pages/nav_pages/main_page.dart';
import 'package:travel_app/pages/welcome_page.dart';

import '../misc/colors.dart';

class AppCubitLogic extends StatefulWidget {
  const AppCubitLogic({super.key});

  @override
  State<AppCubitLogic> createState() => _AppCubitLogicState();
}

class _AppCubitLogicState extends State<AppCubitLogic> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppState>(
        builder:(context,state){
          if(state is WelcomeState){
            return WelcomePage();
          }
          else if(state is LoadingState){
            return  Scaffold(body: Center(child: CircularProgressIndicator(color: AppColors.mainColor,)));
          }
          else if(state is LoadedState){
            return const MainPage();
          }
          else if(state is DetailState){
            return const DetailPage();
          }
          else{
            return Container();
          }
        }
    );
  }
}
