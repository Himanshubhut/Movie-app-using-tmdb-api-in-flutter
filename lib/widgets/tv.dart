import 'package:flutter/material.dart';
import 'package:movie_app/descripition.dart';
import 'package:movie_app/utiles/text.dart';

class TV extends StatelessWidget {
  final List Tv;
  const TV({super.key, required this.Tv});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Modified_text(
                text: 'Famous tv shows', color: Colors.white, size: 30),
            const SizedBox(height: 10),
            Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Tv.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                       
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        width: 250,
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              width: 270,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(90),
                                  image: DecorationImage(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      image: NetworkImage(
                                          // ignore: prefer_interpolation_to_compose_strings
                                          'https://image.tmdb.org/t/p/w500' +
                                              Tv[index]['backdrop_path']))),
                            ),
                            Container(
                              child: Modified_text(
                                  // ignore: prefer_if_null_operators
                                  text: Tv[index]['original_name'] != null
                                      ? Tv[index]['original_name']
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
