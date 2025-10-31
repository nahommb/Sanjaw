class PostModel {

  final int id;
  final String title;
  final String content;
  final String? imageUrl;
  final DateTime? createdAt;
  final String? videoUrl;
  final String? author;


  PostModel(
      {
      required this.id,
      required this.title,
      required this.content,
      this.imageUrl,
      this.createdAt,
      this.videoUrl,
      this.author
      }
  );
  
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      imageUrl: json['image_url'] as String?,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      videoUrl: json['video_url'] as String?,
      author: json['author'] as String?,
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
    };
  }
}