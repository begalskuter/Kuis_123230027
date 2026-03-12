import 'package:flutter/material.dart';
import '../models/game_data.dart';

class GameDetailPage extends StatelessWidget {
  final GameStore game;

  const GameDetailPage({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(game.name),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(game.imageUrls[0]),
              const SizedBox(height: 16),
              Text(
                game.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              Text("Release Date: ${game.releaseDate}"),
              const SizedBox(height: 8),

              Text("Price: ${game.price}"),
              const SizedBox(height: 8),

              Text("Rating: ${game.reviewAverage}"),
              const SizedBox(height: 8),

              Text("Reviews: ${game.reviewCount}"),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                children: game.tags.map((tag) {
                  return Chip(label: Text(tag));
                }).toList(),
              ),
              const SizedBox(height: 16),
              const Text(
                "About Game",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 8),

              Text(game.about),

              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {

                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Game berhasil di beli"),
                      ),
                    );

                  },
                  child: const Text("BELI "),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}