import 'package:flutter/material.dart';

class TextRow extends StatelessWidget {
  final String title;
  final String description;

  const TextRow({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(width: 15),
            Expanded(
                child: Text(
              description,
            ))
          ],
        ),
      ),
    );
  }
}
