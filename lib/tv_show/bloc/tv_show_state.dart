import 'package:ebmrox_3version/tv_show/repository/model/tv_show_model.dart';

abstract class TVShowState {}

class TVShowInitialState extends TVShowState {}

class TVShowLoadingState extends TVShowState {}

class TVShowLoadedState extends TVShowState {
  final List<TVShowModel> shows;

  TVShowLoadedState(this.shows);
}

class TVShowEmptyState extends TVShowState {}

class TVShowErrorState extends TVShowState {}
