import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/model/welcome_data_model.dart';
import 'package:travel_app/services/data_services.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial()){
    emit(WelcomeState());
  }

  static AppCubit get(context)=>BlocProvider.of(context);


  DataServices data = DataServices();
  late List<DataModel> places;
  void getData()async{
    emit(LoadingState());
    places = await data.getInfo();
     emit(LoadedState(places));
  }



  void goToDetailPage(DataModel model){
    emit(DetailState(model));
  }
  void goToHomePage(){
    emit(LoadedState(places));
  }
}
