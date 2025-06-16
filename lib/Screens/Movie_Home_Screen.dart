import 'package:flutter/material.dart';
import 'package:streamline/Screens/Movie_Details_Screen.dart';
import 'package:streamline/Screens/Models/Movie.dart';



class MovieHomeScreen extends StatelessWidget {

  final List<Movie> midnightPicks = [
    Movie(
      'The Silent Echo',
      'Drama',
      'assets/images/The-Silent-Echo.jpg',
      'A renowned composer, haunted by a tragic past, seeks solace in a remote village. There, he rediscovers his inspiration through music, confronting inner demons.',
      cast: [
        {
          'name': 'Elias Thomas',
          'role': 'Composer',
          'image': 'assets/images/The-Silent-Echo.jpg',
        },
        {
          'name': 'Clara Hayes',
          'role': 'The Silent Woman',
          'image': 'assets/images/The-Silent-Echo.jpg',
        },
      ],
      trailers: [
        'assets/images/The-Silent-Echo.jpg',
        'assets/images/The-Silent-Echo.jpg',
      ],
      platforms: [
        {
          'name': 'Prime Video',
          'icon': 'assets/images/OTT-Images/Prime.webp',
          'price': '\$4.99',
        },
        {
          'name': 'iTunes',
          'icon': 'assets/images/OTT-Images/Itunes.jpeg',
          'price': '\$3.99',
        },
        {
          'name': 'Hulu',
          'icon': 'assets/images/OTT-Images/Hulu.jpg',
          'price': 'Free',
        },
      ],
    ),
    Movie(
      'Crimson Horizon',
      'Thriller',
      'assets/images/Crimson-Horizon.jpg',
      'An ex-agent discovers a global conspiracy.',
      cast: [
        {
          'name': 'Elias Thomas',
          'role': 'Composer',
          'image': 'assets/images/Crimson-Horizon.jpg',
        },
        {
          'name': 'Clara Hayes',
          'role': 'The Silent Woman',
          'image': 'assets/images/Crimson-Horizon.jpg',
        },
      ],
      trailers: [
        'assets/images/Crimson-Horizon.jpg',
        'assets/images/Crimson-Horizon.jpg',
      ],
      platforms: [
        {
          'name': 'Prime Video',
          'icon': 'assets/images/OTT-Images/Prime.webp',
          'price': '\$4.99',
        },
        {
          'name': 'iTunes',
          'icon': 'assets/images/OTT-Images/Itunes.jpeg',
          'price': '\$3.99',
        },
        {
          'name': 'Hulu',
          'icon': 'assets/images/OTT-Images/Hulu.jpg',
          'price': 'Free',
        },
      ],
    ),

    // Movie('Crimson Horizon', 'Thriller', 'assets/images/Crimson-Horizon.jpg',
    //     'An ex-agent discovers a global conspiracy.'),
    Movie('The End Game', 'Thriller', 'assets/images/End-Game.jpeg',
        'In a world of deception, survival is the only goal.'),
  ];

  final List<Movie> nowTrending = [
    Movie('Cyber Pulse', 'Sci-Fi', 'assets/images/Pulse.jpg',
    'In a world where technology controls everything, a group of rebels discovers a hidden pulse signal that can disrupt the entire system.'),
    Movie('Dark Mirage', 'Mystery', 'assets/images/Mirage.jpg',
    'A detective investigates a series of mysterious disappearances in a city where reality and illusion blur.'),
    Movie('Sunset Riders', 'Action', 'assets/images/Sunset-Rider.jpg',
    'In a post-apocalyptic world, a group of survivors must navigate through dangerous territories to find a safe haven.'),
  ];

  final List<Movie> newReleases = [
    Movie('Nebula\'s Edge', 'Sci-Fi', 'assets/images/Nebula.jpg',
        'In a dystopian future run by artificial intelligence, a rogue hacker discovers a pulse signal capable of shutting down the entire AI network—if he can stay alive long enough to use it.'),
    Movie('Street Snap Pro', 'Action', 'assets/images/Dark-Tower.webp',
    'A renowned illusionist disappears mid-show, leaving behind a shattered mirror and no trace. As a detective dives deeper, reality begins to blur with illusion in a deadly game of truth and deception.'),
    Movie('Laughing Matters', 'Comedy', 'assets/images/Laughing-Matters.jpg',
    'Set in a sun-scorched wasteland, a band of ex-lawmen turned mercenaries ride into enemy territory for one last mission—rescue the daughter of a fallen comrade from a ruthless warlord.'),
  ];
  final List<Movie> continueWatching = [
    Movie('The Enigma Code', 'Thriller', 'assets/images/End-Game.jpeg',
    'A cryptic message leads a group of friends on a dangerous quest to uncover a hidden truth that could change their lives forever.'),
    Movie('Cyber Pulse', 'Sci-Fi', 'assets/images/Pulse.jpg',''
        'In a world where technology controls everything, a group of rebels discovers a hidden pulse signal that can disrupt the entire system.'),
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
            verticalMovieList(context, continueWatching),

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
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
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
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MovieDetailScreen(movie: movie),
                ),
              );
            },
            child: Column(
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
            ),
          );
        },
      ),
    );
  }




  Widget verticalMovieList(BuildContext context, List<Movie> movies) {
    return Column(
      children: movies.map((movie) {
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MovieDetailScreen(movie: movie),
              ),
            );
          },
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

