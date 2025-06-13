import 'package:flutter/material.dart';

class MovieHomeScreen extends StatelessWidget {

  final List<Movie> midnightPicks = [
    Movie('The Silent Echo', 'Drama', 'assets/images/The-Silent-Echo.jpg'),
    Movie('Crimson Horizon', 'Thriller', 'assets/images/Crimson-Horizon.jpg'),
    Movie('The End Game', 'Thriller', 'assets/images/End-Game.jpeg'),
  ];

  final List<Movie> nowTrending = [
    Movie('Cyber Pulse', 'Sci-Fi', 'assets/images/Pulse.jpg'),
    Movie('Dark Mirage', 'Mystery', 'assets/images/Mirage.jpg'),
    Movie('Sunset Riders', 'Action', 'assets/images/Sunset-Rider.jpg'),
  ];

  final List<Movie> newReleases = [
    Movie('Nebula\'s Edge', 'Sci-Fi', 'assets/images/Nebula.jpg'),
    Movie('Street Snap Pro', 'Action', 'assets/images/Dark-Tower.webp'),
    Movie('Laughing Matters', 'Comedy', 'assets/images/Laughing-Matters.jpg'),
  ];
  final List<Movie> continueWatching = [
    Movie('The Enigma Code', 'Thriller', 'assets/images/End-Game.jpeg'),
    Movie('Cyber Pulse', 'Sci-Fi', 'assets/images/Pulse.jpg'),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Movies',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionTitle("Your Midnight Picks"),
            horizontalMovieList(midnightPicks),

            sectionTitle("Now Trending"),
            horizontalMovieList(nowTrending),

            sectionTitle("Continue Watching"),
            verticalMovieList(continueWatching),

            sectionTitle("New Releases"),
            horizontalMovieList(newReleases),


            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Color(0xFF4747EB),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.movie_creation_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget horizontalMovieList(List<Movie> movies) {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 120,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(movie.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(movie.title,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(movie.genre, style: const TextStyle(color: Colors.grey)),
            ],
          );
        },
      ),
    );
  }


  Widget verticalMovieList(List<Movie> movies) {
    return Column(
      children: movies.map((movie) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(movie.imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(movie.title),
          subtitle: Text(movie.genre),
        );
      }).toList(),
    );
  }

}

class Movie {
  final String title;
  final String genre;
  final String imagePath;

  Movie(this.title, this.genre, this.imagePath);
}

