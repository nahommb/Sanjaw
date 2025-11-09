import 'dart:convert';

class PostModel {
  final int id;
  final String title;
  final String content;
  final String? imageUrl;
  final DateTime? createdAt;
  final String? videoUrl;
  final String? author;
  final List<String> mediaUrls; // not nullable for easier use

  PostModel({
    required this.id,
    required this.title,
    required this.content,
    this.imageUrl,
    this.createdAt,
    this.videoUrl,
    this.author,
    this.mediaUrls = const [], // default empty list
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    // Handle cases where media_urls is:
    //  - null
    //  - a JSON string like '["url1","url2"]'
    //  - a normal List<dynamic>
    List<String> parsedMediaUrls = [];

    if (json['media_urls'] != null) {
      final raw = json['media_urls'];

      try {
        if (raw is String && raw.isNotEmpty) {
          final decoded = jsonDecode(raw);
          if (decoded is List) {
            parsedMediaUrls = decoded.map((e) => e.toString()).toList();
          }
        } else if (raw is List) {
          parsedMediaUrls = raw.map((e) => e.toString()).toList();
        }
      } catch (e) {
        print("⚠️ Failed to parse media_urls: $e");
      }
    }

    return PostModel(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      imageUrl: json['image_url'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      videoUrl: json['video_url'] as String?,
      author: json['author'] as String?,
      mediaUrls: parsedMediaUrls,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'imageUrl': imageUrl,
      'createdAt': createdAt?.toIso8601String(),
      'videoUrl': videoUrl,
      'author': author,
      'mediaUrls': mediaUrls,
    };
  }
}
