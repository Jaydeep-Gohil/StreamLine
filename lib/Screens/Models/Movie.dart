class Movie {
  final String title;
  final String genre;
  final String imagePath;
  final String description;
  final List<Map<String, String>> cast;
  final List<String> trailers;
  final List<Map<String, String>> platforms;

  Movie(
      this.title,
      this.genre,
      this.imagePath,
      this.description, {
        this.cast = const [],
        this.trailers = const [],
        this.platforms = const [],
      });
}
