import 'package:belajar_flutter/41.shimmer/data.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FoodListView extends StatelessWidget {
  final List<Food> foodItems;
  final bool isLoading;

  const FoodListView({
    Key? key,
    required this.foodItems,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  leading: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 60,
                      width: 60,
                      color: Colors.grey[300],
                    ),
                  ),
                  title: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 16,
                      color: Colors.grey[300],
                    ),
                  ),
                  subtitle: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 16,
                      color: Colors.grey[300],
                    ),
                  ),
                  trailing: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 24,
                      width: 24,
                      color: Colors.grey[300],
                    ),
                  ),
                );
              },
              childCount: 10,
            ),
          )
        : SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final food = foodItems[index];
                return ListTile(
                  leading: Image.network(
                    food.imageURL,
                    height: 60.0,
                    width: 60.0,
                    fit: BoxFit.cover,
                  ),
                  title: Text(food.name),
                  subtitle: Text('\$${food.price}'),
                  trailing: const Icon(Icons.chevron_right),
                );
              },
              childCount: foodItems.length,
            ),
          );
  }
}

// 1.250.000
//
