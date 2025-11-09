import 'package:flutter/material.dart';
import 'package:sanjaw/features/home/presentation/widgets/post_video_player.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sanjaw/core/helper/time_ago.dart';
import 'package:sanjaw/features/home/data/models/post_model.dart';

class PostContainer extends StatefulWidget {
  final List<PostModel> posts;

  const PostContainer({super.key, required this.posts});

  @override
  State<PostContainer> createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  // Keep track of page controllers for each post
  final Map<int, PageController> _controllers = {};

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      child: Column(
        children: widget.posts.map((post) {
          final index = widget.posts.indexOf(post);
          final controller = _controllers[index] ??= PageController();

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
                  // 🖼️ MEDIA SECTION
                  if (post.mediaUrls.isNotEmpty)
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        SizedBox(
                          height: 400,
                          child: PageView.builder(
                            controller: controller,
                            itemCount: post.mediaUrls.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, pageIndex) {
                              final url = post.mediaUrls[pageIndex];
                              final isVideo = url.endsWith('.mp4') ||
                                  url.endsWith('.mov') ||
                                  url.endsWith('.avi') ||
                                  url.endsWith('.mkv');

                              if (isVideo) {
                                return VideoPost(url: post.mediaUrls[pageIndex]);
                                
                              } else {
                                return Image.network(
                                  url,
                                  width: double.infinity,
                                  height: 400,
                                  fit: BoxFit.cover,
                                  errorBuilder:
                                      (context, error, stackTrace) => const Center(
                                    child: Icon(Icons.broken_image,
                                        size: 60, color: Colors.grey),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        // 🔵 Dots Indicator
                        Positioned(
                          bottom: 10,
                          child: SmoothPageIndicator(
                            controller: controller,
                            count: post.mediaUrls.length,
                            effect: const WormEffect(
                              dotHeight: 8,
                              dotWidth: 8,
                              spacing: 6,
                              activeDotColor: Colors.white,
                              dotColor: Colors.white54,
                            ),
                          ),
                        ),
                      ],
                    )
                  else
                    Container(
                      // height: 200,
                      color: Colors.grey[200],
                      // child: const Center(child: Text('No media available')),
                    ),

                  // 📝 CONTENT SECTION
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      post.content,
                      style: const TextStyle(fontSize: 14, height: 1.4),
                    ),
                  ),

                  // 👤 FOOTER
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          timeAgo(post.createdAt ?? DateTime.now()),
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Posted by: ${post.author ?? "Unknown"}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
