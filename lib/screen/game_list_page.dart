import 'package:flutter/material.dart';
import 'package:latihan_kuis_a/screen/game_detail_page.dart';
import 'package:latihan_kuis_a/screen/profile_page.dart';
import 'package:latihan_kuis_a/models/game_data.dart';

class GameListPage extends StatefulWidget {
  final String username;
  const GameListPage({super.key, required this.username});
  @override  
  State<GameListPage> createState() => _GameListPageState();
}

class _GameListPageState extends State<GameListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Selamat Datang ${widget.username}!',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(username: widget.username),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(6),
        itemCount: gameList.length,
        itemBuilder: (context, index) {
          final game = gameList[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GameDetailPage(game: game),
                ),
              ).then((_) {
                setState(() {});
              });
            },
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(color: Colors.black, width: 0.5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // IMAGE
                    SizedBox(
                      width: 60,
                      height: 90,
                      child: Image.network(
                        game.imageUrls[0],
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(width: 10),

                    // TEXT INFO
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${game.name}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 4),

                          Text(
                            'price: ${game.price}',
                            style: const TextStyle(fontSize: 12),
                          ),

                          const SizedBox(height: 4),

                

                          // ===== LIKE COUNT DISPLAY (BARU) =====
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(
                                Icons.favorite,
                                color: Colors.red,
                      
                                size: 12,
                              ),
                              const SizedBox(width: 3),
                              Text(
                                '${game.likeCount} likes',
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // ===== LIKE & BOOKMARK BUTTONS (UPDATED) =====
                    SizedBox(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // LIKE BUTTON (BARU)
                          IconButton(
                            iconSize: 18,
                            icon: Icon(
                              game.isLiked
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: game.isLiked ? Colors.red : Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                if (game.isLiked) {
                                  game.likeCount--;
                                  game.isLiked = false;
                                } else {
                                  game.likeCount++;
                                  game.isLiked = true;
                                }
                              });
                            },
                          ),

                          // BOOKMARK BUTTON (YANG SUDAH ADA)
                          // IconButton(
                          //   iconSize: 20,
                          //   icon: Icon(
                          //     //isBookmarked
                          //         ? Icons.bookmark
                          //         : Icons.bookmark_border,
                          //     color: isBookmarked ? Colors.blue : null,
                          //   ),
                          //   onPressed: () {
                          //     setState(() {
                          //      // movie.isBookmarked = !movie.isBookmarked;
                          //     });
                          //   },
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
