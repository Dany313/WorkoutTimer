import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:test_drive/model/random_image.dart';

class ImmaginiFragment extends StatefulWidget {
  const ImmaginiFragment({super.key});

  @override
  State<ImmaginiFragment> createState() => _ImmaginiFragmentState();
}

class _ImmaginiFragmentState extends State<ImmaginiFragment> {
  static const _pageSize = 30;
  late Future<List<RandomImage>> images;
  final PagingController<int, RandomImage> _pagingController =
  PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await getImages(pageKey);
      List<RandomImage> stringImages = newItems.toList();
      final isLastPage = stringImages.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(stringImages);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(stringImages, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return PagedGridView<int, RandomImage>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<RandomImage>(
          itemBuilder: (context, RandomImage item, int index) {
            return Image.network(item.url);
          }
        ), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
      );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<List<RandomImage>> getImages(int page) async {
    String url = "https://picsum.photos/v2/list?page=$page&limit=$_pageSize";

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List body = json.decode(response.body);
      return body.map((e) => RandomImage.fromJson(e)).toList();
    } else {
      throw Exception("errore");
    }
  }
}
