import 'package:flutter/material.dart';
import '../model/person.dart';

class PersonCard extends StatelessWidget {
  final Person person;

  const PersonCard({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(person.image),
        ),
        title: Text(person.firstName),
        subtitle: Text(person.lastName),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
      ),
    );
  }
}
