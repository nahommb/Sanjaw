import 'package:flutter/material.dart';
import 'package:sanjaw/core/helper/time_ago.dart';
import 'package:sanjaw/features/home/data/models/post_model.dart';

class PostContainer extends StatelessWidget {
  final List<PostModel> posts;

  const PostContainer({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: posts.map((post) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              width: double.infinity,
              
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    post.imageUrl!,
                    width: double.infinity,
                    height: 400,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      post.content!,
                      style: const TextStyle(fontSize: 14, height: 1.4),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(padding: const EdgeInsets.all(8.0),
                      child: Text(timeAgo(post.createdAt!)),
                      ),
                      Padding(padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Posted by: ${post.author ?? "Unknown"}',
                        style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                      ),),

                    ],
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
