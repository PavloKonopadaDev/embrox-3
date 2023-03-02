class TVShowModel {
  final int id;
  final String name;
  final String? image;
  final double? rating;
  final List<String>? genres;
  final String? summary;
  final String? status;
  final Map<String, dynamic>? schedule;
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
      image: json['show']['image'] != null
          ? json['show']['image']['medium']
          : null,
      rating: json['show']['rating']['average'] != null
          ? json['show']['rating']['average'].toDouble()
          : null,
      genres: json['show']['genres'] != null
          ? List<String>.from(json['show']['genres'])
          : null,
      summary: json['show']['summary'] != null
          ? json['show']['summary'].replaceAll(RegExp('<[^>]*>'), '')
          : null,
      status: json['show']['status'] != null ? json['show']['status'] : null,
      schedule:
          json['show']['schedule'] != null ? json['show']['schedule'] : null,
      url: json['show']['url'] != null ? json['show']['url'] : null,
    );
  }
}
