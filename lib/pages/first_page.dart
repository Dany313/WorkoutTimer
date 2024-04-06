import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/person.dart';
import '../widgets/person_card.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late Future<List<Person>> people;

  @override
  void initState() {
    super.initState();
    people = getPeople();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Person>>(
      future: people,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          // Gestisci l'errore...
          return Text('Errore: ${snapshot.error}');
        } else if (snapshot.connectionState != ConnectionState.done) {
          // Mostra uno stato di attesa...
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          // I dati sono pronti, puoi visualizzarli...
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, int index) {
              return PersonCard(person: snapshot.data![index]);
            },
          );
        } else {
          return const Placeholder();
        }
      },
    );
  }

  Future<List<Person>> getPeople() async {
    String url = "https://randomuser.me/api/?results=50";

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      // body: {
      //   'api_token': '768ef1810185cd6562478f61d2',
      //   'product_id': '100',
      //   'quantity': '1',
      // },
    );

    if (response.statusCode == 200) {
      final List body = json.decode(response.body)['results'];
      return body.map((e) => Person.fromJson(e)).toList();
    } else {
      throw Exception("errore");
    }
  }
}
