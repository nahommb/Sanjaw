import 'package:flutter/material.dart';
import 'package:sanjaw/core/config/app_colors.dart';

class PlayersScreen extends StatelessWidget {
  const PlayersScreen({super.key});

  static String routeName = 'player_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        
      ),
      body: const PlayerCategoryList(),
    );
  }
}

class PlayerCategoryList extends StatelessWidget {
  const PlayerCategoryList({super.key});

  final Map<String, List<String>> playerCategories = const {
    'Goalkeepers': ['Neymar jr', 'Cunha'],
    'Defenders': ['Jota', 'Di maria', 'Messi'],
    'Midfielders': ['Sesko', 'Amad', 'Hazard'],
    'Attackers': ['Maguare', 'Saka', 'De gea', 'Rashford'],
  };

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: playerCategories.entries.map((entry) {
        final categoryName = entry.key;
        final players = entry.value;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categoryName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 10),
            GridView.builder(
              itemCount: players.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 12,
                childAspectRatio: 1/ 1, // taller cards for better image fit
              ),
              itemBuilder: (context, index) {
                final player = players[index];
                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  clipBehavior: Clip.antiAlias, // ensures rounded image corners
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          child: Image.network(
                            'https://picsum.photos/200/300?random=$index',
                            fit: BoxFit.cover, // 👈 makes the image fill the card
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '$player 11',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
          ],
        );
      }).toList(),
    );
  }
}
