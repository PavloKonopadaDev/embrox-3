abstract class TVShowEvent {}

class SearchTVShowEvent extends TVShowEvent {
  final String query;

  SearchTVShowEvent(this.query);
}
