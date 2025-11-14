import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sanjaw/features/home/presentation/provider/match_day_provider.dart';
import 'package:sanjaw/features/home/presentation/provider/post_provider.dart';
import 'package:sanjaw/features/home/presentation/provider/story_provider.dart';
import 'package:sanjaw/features/home/presentation/widgets/card_scroller.dart';
import 'package:sanjaw/features/home/presentation/widgets/story_scroller.dart';
import 'package:sanjaw/features/home/presentation/widgets/post_container.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // ref.read(storyListProvider.notifier).fetchStory();
    // ref.read(postListProvider.notifier).fetchPosts(); // first fetch

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        ref.read(postListProvider.notifier).fetchPosts();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final postAsync = ref.watch(postListProvider);
    final matchDayAsync = ref.watch(matchDayListProvider);
    final storyAsync = ref.watch(storyListProvider);
    
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async{
          await ref.read(postListProvider.notifier).fetchPosts();
          await ref.read(matchDayListProvider.notifier).fetchMatchDays();
        },
        child: postAsync.when(
          data: (posts) => SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StoryScroller(story: storyAsync.when(data: (story)=>story, error: (_,_)=>const [], loading: ()=> const[]),),
                CardScroller(
                  matchDays: matchDayAsync.when(
                    data: (matchDays) => matchDays,
                    loading: () => const [],
                    error: (_, __) => const [],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 18),
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                    "What's New",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                PostContainer(posts: posts), // ✅ now passing List<PostModel>
                const SizedBox(height: 60),
              ],
            ),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (err, _) => Center(
            child: Text("${err}"),
          ),
        ),
      ),
    );
  }
}
