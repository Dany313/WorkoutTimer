import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_drive/model/random_image.dart';

class ImmaginiFragment extends StatefulWidget {
  const ImmaginiFragment({super.key});

  @override
  State<ImmaginiFragment> createState() => _ImmaginiFragmentState();
}

class _ImmaginiFragmentState extends State<ImmaginiFragment> {
  
  late Future<List<RandomImage>> images;
  
  @override
  void initState() {
    super.initState();
    images = getImages();
  }
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RandomImage>>(
      future: images,
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
          return GridView.builder(
            itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
              ), itemBuilder: ( context, int index) {
            return Center(child: Image.network(snapshot.data![index].url));
          },);
        } else {
          return const Placeholder();
        }
      },
    );
  }

  Future<List<RandomImage>> getImages() async {
    String url = "https://picsum.photos/v2/list?limit=100";

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
      final List body = json.decode(response.body);
      return body.map((e) => RandomImage.fromJson(e)).toList();
    } else {
      throw Exception("errore");
    }
  }
}
