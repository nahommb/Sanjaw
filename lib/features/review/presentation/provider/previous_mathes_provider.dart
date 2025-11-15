
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:sanjaw/features/review/data/model/previousMatchesModel.dart';
import 'package:sanjaw/features/review/data/repositories/previous_match_repository.dart';

final previousMatchRepository = Provider((ref)=>PreviousMatchRepository());

final previousMachesListProvider = StateNotifierProvider<PreviousMatchesNotifier,AsyncValue<List<Previousmatchesmodel>>>((ref){

  final repository  = ref.read(previousMatchRepository);

  return PreviousMatchesNotifier(repository);
});

class PreviousMatchesNotifier extends StateNotifier<AsyncValue<List<Previousmatchesmodel>>> {

   final PreviousMatchRepository repository;

  PreviousMatchesNotifier(this.repository):super(AsyncValue.loading()){
   fetchPreviousMatches();
  }

  Future<void> fetchPreviousMatches()async{
    
    try{
    final data = await repository.fetchPreviousMatches();
    state = AsyncData([...data]);
    }
    catch(err){    
      print(err);
    }
 
  }
}
