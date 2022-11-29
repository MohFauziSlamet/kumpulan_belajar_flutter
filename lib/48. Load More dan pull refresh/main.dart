import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  runApp(const LoadMoreApp());
}

class LoadMoreApp extends StatefulWidget {
  const LoadMoreApp({Key? key}) : super(key: key);

  @override
  State<LoadMoreApp> createState() => _LoadMoreAppState();
}

class _LoadMoreAppState extends State<LoadMoreApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePageLoad(),
    );
  }
}

class HomePageLoad extends StatefulWidget {
  const HomePageLoad({Key? key}) : super(key: key);

  @override
  State<HomePageLoad> createState() => _HomePageLoadState();
}

class _HomePageLoadState extends State<HomePageLoad> {
  final controller = ScrollController();
  List<String> items = [];
  bool hasMore = true;
  bool isLoading = false;
  int page = 1;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetch();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future fetch() async {
    if (isLoading) return;
    isLoading = true;
    const limit = 25;
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts?_limit=$limit&_page=$page');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List newsItem = json.decode(response.body);

      setState(
        () {
          page++;
          isLoading = false;
          if (newsItem.length < limit) {
            hasMore = false;
          }
          items.addAll(newsItem.map<String>((item) {
            final number = item['id'];
            return 'item$number';
          }).toList());
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Load More'),
        centerTitle: true,
      ),
      body: ListView.builder(
        controller: controller,
        itemCount: items.length + 1,
        itemBuilder: (context, index) {
          if (index < items.length) {
            final item = items[index];
            return ListTile(
              title: Text(item),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Center(
                child: hasMore ? const CircularProgressIndicator() : const Text('No more data to load'),
              ),
            );
          }
        },
      ),
    );
  }
}
