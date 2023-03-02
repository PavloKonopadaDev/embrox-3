class TVShowModel {
  final int id;
  final String name;
  final String? image;
  final double? rating;
  final List<String>? genres;
  final String? summary;
  final String? status;
  final String? schedule;
  final String? url;

  TVShowModel({
    required this.id,
    required this.name,
    this.image,
    this.rating,
    this.genres,
    this.summary,
    this.status,
    this.schedule,
    this.url,
  });

  factory TVShowModel.fromJson(Map<String, dynamic> json) {
    return TVShowModel(
      id: json['show']['id'],
      name: json['show']['name'],
      image: json['show']['image'] != null ? json['show']['image']['medium'] : null,
      rating: json['show']['rating']['average'] != null ? json['show']['rating']['average'].toDouble() : 0,
      genres: List<String>.from(json['show']['genres']),
      summary: json['show']['summary'] != null ? json['show']['summary'].replaceAll(RegExp('<[^>]*>'), '') : "",
      status: json['show']['status'],
      schedule: json['show']['schedule']['time'] + ' ' + json['show']['schedule']['days'][0],
      url: json['show']['url'],
    );
  }
}
