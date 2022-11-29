import 'package:belajar_flutter/41.shimmer/data.dart';
import 'package:belajar_flutter/41.shimmer/widgets/food_list_view.dart';
import 'package:belajar_flutter/41.shimmer/widgets/food_page_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class FakeRepository {
  Future<List<Food>> mockRequest() async => await Future.delayed(const Duration(seconds: 5), () => foodData);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Shimmer Loading',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => FakeRepository().mockRequest(),
        child: FutureBuilder(
          future: FakeRepository().mockRequest(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final foodItems = snapshot.data as List<Food>;
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: FoodPageView(foodItems: foodItems)),
                  const SliverToBoxAdapter(
                    child: Divider(indent: 12.0, endIndent: 12.0),
                  ),
                  FoodListView(foodItems: foodItems),
                ],
              );
            }
            return const CustomScrollView(
              physics: NeverScrollableScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                    child: FoodPageView(
                  foodItems: [],
                  isLoading: true,
                )),
                SliverToBoxAdapter(
                  child: Divider(indent: 12.0, endIndent: 12.0),
                ),
                FoodListView(
                  foodItems: [],
                  isLoading: true,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
