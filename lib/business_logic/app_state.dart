part of 'app_cubit.dart';

abstract class AppState extends Equatable {}

class AppInitial extends AppState {
  @override
  List<Object?> get props => [];
}


class WelcomeState extends AppState{
  @override
  List<Object?> get props => [];

}

class LoadingState extends AppState{
  @override
  List<Object?> get props => [];

}
class LoadedState extends AppState{
  final List<DataModel> places;

  LoadedState(this.places);

  @override
  List<Object?> get props => [places];

}


class DetailState extends AppState{
  final DataModel places;

  DetailState(this.places);

  @override
  List<Object?> get props => [places];

}