import 'package:flutter/material.dart';
import 'package:flutter_gallery_app/provider/gallery_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gallery = ref.watch(galleryProvider);

    final images = gallery == "camping" ? campingImages : travelImages;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Gallery App"),
        backgroundColor: Colors.blue,
        actions: [
          TextButton(
            onPressed: () {
              ref.read(galleryProvider.notifier).state = "camping";
            },
            child: const Text(
              "캠핑",
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              ref.read(galleryProvider.notifier).state = "travel";
            },
            child: const Text(
              "여행",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: images.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network(
              images[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
