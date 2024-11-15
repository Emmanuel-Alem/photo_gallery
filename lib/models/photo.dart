class Photo {
  final int id;
  final String title;
  final String thumbnailUrl;

  Photo({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
  });

  // Factory method to create a Photo instance from JSON
  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      title: json['title'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}
