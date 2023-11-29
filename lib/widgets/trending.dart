// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:movie_app/descripition.dart';
import 'package:movie_app/utiles/text.dart';

class Trendingmovies extends StatelessWidget {
  final List trending;
  const Trendingmovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Modified_text(
                text: 'trending movies', color: Colors.white, size: 30),
            SizedBox(height: 10),
            Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trending.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Descripition(
                                      name: trending[index]['title'],
                                      // ignore: prefer_interpolation_to_compose_strings
                                      bannnerurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              trending[index]['backdrop_path'],
                                      // ignore: prefer_interpolation_to_compose_strings
                                      posturi:
                                          // ignore: prefer_interpolation_to_compose_strings
                                          'https://image.tmdb.org/t/p/w500' +
                                              trending[index]['poster_path'],
                                      descripition: trending[index]['overview'],
                                      vote: trending[index]['vote_average']
                                          .toString(),
                                      launch_date: trending[index]
                                          ['release_date'],
                                    )));
                      },
                      child: trending[index]['title'] != null
                          ? Container(
                              width: 140,
                              child: Column(
                                children: [
                                  Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            // ignore: prefer_interpolation_to_compose_strings
                                            image: NetworkImage(
                                                // ignore: prefer_interpolation_to_compose_strings
                                                'https://image.tmdb.org/t/p/w500' +
                                                    trending[index]
                                                        ['poster_path']))),
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    child: Modified_text(
                                        // ignore: prefer_if_null_operators
                                        text: trending[index]['title'] != null
                                            ? trending[index]['title']
                                            : 'loading',
                                        color: Colors.white,
                                        size: 15),
                                  )
                                ],
                              ),
                            )
                          : Container(),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
