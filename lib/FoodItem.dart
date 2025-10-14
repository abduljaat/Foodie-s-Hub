import 'package:flutter/material.dart';
class FoodItemCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String price;

  const FoodItemCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
  });

  @override
  State<FoodItemCard> createState() => _FoodItemCardState();
}
class _FoodItemCardState extends State<FoodItemCard> {
  bool isFavorite = false; // state variable

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              widget.imageUrl,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.price,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.redAccent,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite; // toggle state
              });
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
