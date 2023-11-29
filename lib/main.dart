import 'package:flutter/material.dart';
import 'package:movie_app/utiles/text.dart';
import 'package:movie_app/widgets/toprated.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:movie_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];

  final String apikey = '4ee09caee73af684c56da8958f08f4b7';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZWUwOWNhZWU3M2FmNjg0YzU2ZGE4OTU4ZjA4ZjRiNyIsInN1YiI6IjY1MjUzMTMwODNlZTY3MDBlNDM4YzIzNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-3B5ii85qObb_Z-xIWhkQ2sDxKHCAro1Xm6s37f4xwA';
  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbwithcustomlog = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trandingresult = await tmdbwithcustomlog.v3.trending.getTrending();
    Map topresult = await tmdbwithcustomlog.v3.movies.getTopRated();
    Map tvresult = await tmdbwithcustomlog.v3.tv.getPopular();

    setState(() {
      trendingmovies = trandingresult['results'];
      topratedmovies = topresult['results'];
      tv = tvresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
            const Modified_text(text: "MOVIE APP 🎥", color: Colors.white, size: 25),
      ),
      body: ListView(
        children: [
          Toprated(toprated: topratedmovies),
          TV(Tv: tv),
          Trendingmovies(trending: trendingmovies)
        ],
      ),
    );
  }
}
