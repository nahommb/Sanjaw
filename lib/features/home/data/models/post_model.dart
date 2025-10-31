class PostModel {

  final String id;
  final String title;
  final String content;
  final String? imageUrl;
  final DateTime? createdAt;
  final String? videoUrl;


  PostModel(
      {
      required this.id,
      required this.title,
      required this.content,
      this.imageUrl,
      this.createdAt,
      this.videoUrl
      }
  );
  
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      imageUrl: json['image_url'] as String?,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      videoUrl: json['video_url'] as String?,
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
    };
  }
}