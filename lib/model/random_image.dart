class RandomImage{
  final String id;
  final String author;
  final String url;

  RandomImage({
    required this.id,
    required this.author,
    required this.url,
});

  factory RandomImage.fromJson(Map<String, dynamic> json) {
    return RandomImage(
      id: json['id'],
      author: json['author'],
      url: "https://picsum.photos/id/${json["id"]}/300",
    );
  }

}