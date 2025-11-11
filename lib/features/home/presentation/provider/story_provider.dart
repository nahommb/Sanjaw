import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:sanjaw/features/home/data/models/story_model.dart';
import 'package:sanjaw/features/home/data/repositories/story_repository.dart';


final StoryRepositoryProvider = Provider((ref)=>StoryRepository());

final storyListProvider = StateNotifierProvider<StoryNotifier,AsyncValue<StoryModel>>