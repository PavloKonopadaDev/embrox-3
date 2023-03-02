import 'dart:async';
import 'package:ebmrox_3version/tv_show/bloc/tv_show_event.dart';
import 'package:ebmrox_3version/tv_show/bloc/tv_show_state.dart';
import 'package:ebmrox_3version/tv_show/repository/tv_show_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TVShowBloc extends Bloc<TVShowEvent, TVShowState> {
  final ShowRepository _repository;

  TVShowBloc(
    this._repository,
  ) : super(TVShowInitialState());

  @override
  Stream<TVShowState> mapEventToState(TVShowEvent event) async* {
    if (event is SearchTVShowEvent) {
      yield TVShowLoadingState();
      try {
        final shows = await _repository.searchShows(event.query);
        if (shows.isEmpty) {
          yield TVShowEmptyState();
        } else {
          yield TVShowLoadedState(shows);
        }
      } catch (err) {
        yield TVShowErrorState();
      }
    }
  }
}
