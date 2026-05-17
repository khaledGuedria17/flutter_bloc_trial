class GameDto {
  //att
  final String id, name, genre, backgroundImage, released;
  final int rating;
  //.constructor
  const GameDto(
    this.id,
    this.name,
    this.genre,
    this.backgroundImage,
    this.released,
    this.rating,
  );

  //serialization
  factory GameDto.fromJson(Map<String, dynamic> data) {
    //print("GameDTO: Id = " + data['id']);
    return GameDto(
      data['id'],
      data['name'],
      data['genres'][0]['name'],
      data['background_image'],
      data['released'] ?? "N/A",
      data['ratings_count'] ?? 0,
    );
  }
}
