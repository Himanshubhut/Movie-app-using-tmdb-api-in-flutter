import 'package:flutter/material.dart';
import 'package:movie_app/descripition.dart';
import 'package:movie_app/utiles/text.dart';

class Toprated extends StatelessWidget {
  final List toprated;
  const Toprated({super.key, required this.toprated});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Modified_text(
                text: 'top rated movies', color: Colors.white, size: 30),
            const SizedBox(height: 10),
            Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: toprated.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Descripition(
                                      name: toprated[index]['title'],
                                      // ignore: prefer_interpolation_to_compose_strings
                                      bannnerurl:
                                          // ignore: prefer_interpolation_to_compose_strings
                                          'https://image.tmdb.org/t/p/w500' +
                                              toprated[index]['backdrop_path'],
                                      // ignore: prefer_interpolation_to_compose_strings
                                      posturi:
                                          // ignore: prefer_interpolation_to_compose_strings
                                          'https://image.tmdb.org/t/p/w500' +
                                              toprated[index]['poster_path'],
                                      descripition: toprated[index]['overview'],
                                      vote: toprated[index]['vote_average']
                                          .toString(),
                                      launch_date: toprated[index]
                                          ['release_date'],
                                    )));
                      },
                      child: Container(
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
                                              toprated[index]['poster_path']))),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              child: Modified_text(
                                  // ignore: prefer_if_null_operators
                                  text: toprated[index]['title'] != null
                                      ? toprated[index]['title']
                                      : 'loading',
                                  color: Colors.white,
                                  size: 15),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
