import 'package:flutter/material.dart';
import 'package:latihan_kuis_a/models/movie_model.dart';
import 'package:latihan_kuis_a/screen/movie_detail_page.dart';
import 'package:latihan_kuis_a/screen/profile_page.dart';

class MovieListPage extends StatefulWidget {
  final String username;

  const MovieListPage({super.key, required this.username});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Welcome, ${widget.username}!',
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
                  builder: (context) => ProfilePage(
                    username: widget.username,
                  ),
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
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          final movie = movieList[index];
          final isBookmarked = movie.isBookmarked;

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailPage(movie: movie),
                ),
              ).then((_) {
                setState(() {});
              });
            },
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(
                  color: Colors.black,
                  width: 0.5,
                ),
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
                        movie.imgUrl,
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
                            '${movie.title} (${movie.year})',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 4),

                          Text(
                            'Genre: ${movie.genre}',
                            style: const TextStyle(fontSize: 12),
                          ),

                          const SizedBox(height: 4),

                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 14,
                              ),
                              const SizedBox(width: 3),
                              Text(
                                '${movie.rating} / 10',
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),

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
                                '${movie.likeCount} likes',
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
                              movie.isLiked
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: movie.isLiked ? Colors.red : Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                if (movie.isLiked) {
                                  movie.likeCount--;
                                  movie.isLiked = false;
                                } else {
                                  movie.likeCount++;
                                  movie.isLiked = true;
                                }
                              });
                            },
                          ),

                          // BOOKMARK BUTTON (YANG SUDAH ADA)
                          IconButton(
                            iconSize: 20,
                            icon: Icon(
                              isBookmarked
                                  ? Icons.bookmark
                                  : Icons.bookmark_border,
                              color: isBookmarked ? Colors.blue : null,
                            ),
                            onPressed: () {
                              setState(() {
                                movie.isBookmarked = !movie.isBookmarked;
                              });
                            },
                          ),
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