import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:latihan_kuis_a/models/movie_model.dart';

class MovieDetailPage extends StatefulWidget {
  final MovieModel movie;

  const MovieDetailPage({super.key, required this.movie});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  // ===== BUY TICKET STATE =====
  int _quantity = 1;
  final int _ticketPrice = 50000;

  int get _totalPrice => _quantity * _ticketPrice;

  // ===== REVIEW STATE =====
  final TextEditingController _reviewController = TextEditingController();
  String _submittedReview = "";

  // ===== LIKE STATE =====
  int _likeCount = 150;
  bool _isLiked = false;

  Future<void> _launchURL(BuildContext context) async {
    final Uri url = Uri.parse(widget.movie.movieUrl);

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Gagal membuka link')));
      }
    }
  }

  void _buyTickets() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Total Harga untuk $_quantity tiket: Rp $_totalPrice'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _toggleLike() {
    setState(() {
      if (_isLiked) {
        _likeCount--; // Jika sudah liked, kurangi
        _isLiked = false;
      } else {
        _likeCount++; // Jika belum liked, tambah
        _isLiked = true;
      }
    });
  }

  void _submitReview() {
    setState(() {
      _submittedReview = _reviewController.text;
    });

    _reviewController.clear();
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movie Details',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(widget.movie.imgUrl, height: 300, fit: BoxFit.cover),

            Padding(
              padding: const EdgeInsets.all(16.0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.movie.title} (${widget.movie.year})',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    'Directed by ${widget.movie.director}',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    widget.movie.synopsis,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 14),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      IconButton(
                        onPressed: _toggleLike,
                        icon: Icon(
                          _isLiked ? Icons.favorite : Icons.favorite_border,
                          color: _isLiked ? Colors.red : Colors.grey,
                          size: 28,
                        ),
                      ),
                      Text(
                        '$_likeCount likes',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      const Text(
                        'Genre: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(child: Text(widget.movie.genre)),
                    ],
                  ),

                  const SizedBox(height: 4),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Casts: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(child: Text(widget.movie.casts.join(', '))),
                    ],
                  ),

                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 28),
                      const SizedBox(width: 8),
                      Text(
                        'Rated ${widget.movie.rating}/10',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const Divider(height: 40, thickness: 1),

                  // ================= BUY TICKET =================
                  const Text(
                    'Buy Tickets (Rp 50.000 / tiket)',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 12),

                  Column(
                    children: [
                      // ===== TOTAL HARGA ATAS =====
                      Text(
                        'Total Price: Rp $_totalPrice',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (_quantity > 1) {
                                setState(() {
                                  _quantity--;
                                });
                              }
                            },
                            icon: const Icon(Icons.remove_circle_outline),
                          ),

                          Text(
                            '$_quantity',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          IconButton(
                            onPressed: () {
                              setState(() {
                                _quantity++;
                              });
                            },
                            icon: const Icon(Icons.add_circle_outline),
                          ),

                          const Spacer(),

                          ElevatedButton(
                            onPressed: _buyTickets,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            child: const Text('Buy'),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      // ===== TOTAL HARGA BAWAH (STYLE REVIEW) =====
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Text(
                          'Total Price: Rp $_totalPrice',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Divider(height: 40, thickness: 1),

                  // ================= REVIEW =================
                  const Text(
                    'Write a Review',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 8),

                  TextField(
                    controller: _reviewController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'What do you think about this movie?',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: _submitReview,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text('Submit Review'),
                    ),
                  ),

                  const SizedBox(height: 16),

                  if (_submittedReview.isNotEmpty) ...[
                    const Text(
                      'Your Review:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 8),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Text(
                        _submittedReview,
                        style: const TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],

                  const SizedBox(height: 24),

                  // ===== WIKIPEDIA BUTTON =====
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _launchURL(context),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        backgroundColor: Colors.purple.shade50,
                      ),
                      child: const Text(
                        'Go to Wikipedia',
                        style: TextStyle(color: Colors.purple),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
