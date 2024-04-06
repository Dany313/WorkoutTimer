class Person {
  final String firstName;
  final String lastName;
  final String image;
  
  Person({
    required this.firstName,
    required this.lastName,
    required this.image
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
        firstName: json['name']['first'],
        lastName: json['name']['last'],
        image: json['picture']['thumbnail'],
    );
  }
}