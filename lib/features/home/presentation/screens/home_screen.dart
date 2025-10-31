import 'package:flutter/material.dart';
import 'package:sanjaw/features/home/presentation/widgets/card_scroller.dart';
import 'package:sanjaw/features/home/presentation/widgets/story_scroller.dart';
import 'package:sanjaw/features/home/presentation/widgets/post_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, String>> _posts = [];
  bool _isLoading = false;
  int _page = 1;
  final int _limit = 3; // posts per load

  @override
  void initState() {
    super.initState();
    _loadMorePosts();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !_isLoading) {
        _loadMorePosts();
      }
    });
  }

  Future<void> _loadMorePosts() async {
    setState(() => _isLoading = true);

    await Future.delayed(const Duration(seconds: 1)); // simulate delay

    List<Map<String, String>> newPosts = List.generate(_limit, (index) {
      final postNumber = ((_page - 1) * _limit) + index + 1;
      return {
        'image':
            'https://picsum.photos/seed/post_$postNumber/600/300', // random image
        'description': 'Post #$postNumber — Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
      };
    });

    setState(() {
      _posts.addAll(newPosts);
      _isLoading = false;
      _page++;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StoryScroller(),
            const CardScroller(),
            Container(
              margin: const EdgeInsets.only(top: 18),
              padding: const EdgeInsets.all(8),
              child: const Text(
                "What's New",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            PostContainer(posts: _posts),
            if (_isLoading)
              const Padding(
                padding: EdgeInsets.all(20),
                child: Center(child: CircularProgressIndicator()),
              ),
          ],
        ),
      ),
    );
  }
}
