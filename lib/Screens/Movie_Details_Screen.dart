import 'package:flutter/material.dart';
import 'Models/Movie.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;
  String _getWatchType(String platformName) {
    if (platformName.toLowerCase().contains('itunes')) {
      return 'Rent on iTunes';
    } else if (platformName.toLowerCase().contains('prime')) {
      return 'Stream on Prime Video';
    } else if (platformName.toLowerCase().contains('hulu')) {
      return 'Stream on Hulu';
    } else {
      return 'Available on $platformName';
    }
  }


  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(movie.imagePath, height: 200),
              ),
            ),
            const SizedBox(height: 16),
            Text(movie.title,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(movie.genre, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 12),
            Text(movie.description),
            const SizedBox(height: 20),

            // Cast
            if (movie.cast.isNotEmpty) ...[
              const Text("Cast", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: movie.cast.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (_, index) {
                    final actor = movie.cast[index];
                    return Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(actor['image']!),
                          radius: 28,
                        ),
                        const SizedBox(height: 4),
                        Text(actor['name']!, style: const TextStyle(fontSize: 12)),
                        Text(actor['role']!,
                            style: const TextStyle(fontSize: 10, color: Colors.grey)),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],

            // Trailers
            if (movie.trailers.isNotEmpty) ...[
              const Text("Trailers", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: movie.trailers.map((path) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(path, width: 140, fit: BoxFit.cover),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
            ],


            // Platforms
            if (movie.platforms.isNotEmpty) ...[
              const Text(
                "Where to Watch",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              // Platforms List
              Column(
                children: movie.platforms.map((platform) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Platform Icon
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            platform['icon']!,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),

                        // Title & Subtitle
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _getWatchType(platform['name']!),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                platform['price']!,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.purple,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ]


          ],
        ),
      ),
    );
  }
}
