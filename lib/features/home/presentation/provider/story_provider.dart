import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:sanjaw/features/home/data/models/story_model.dart';
import 'package:sanjaw/features/home/data/repositories/story_repository.dart';


final storyRepositoryProvider = Provider((ref)=>StoryRepository());

final storyListProvider = StateNotifierProvider<StoryNotifier,AsyncValue<List<StoryModel>>>((ref){

  final repository = ref.read(storyRepositoryProvider);

  return StoryNotifier(repository);
}
);


class StoryNotifier extends StateNotifier<AsyncValue<List<StoryModel>>>{

  StoryNotifier(StoryRepository repository):super(AsyncValue.loading());

}