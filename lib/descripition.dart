import 'package:flutter/material.dart';
import 'package:movie_app/utiles/text.dart';

class Descripition extends StatelessWidget {
  final String name, descripition, bannnerurl, posturi, vote, launch_date;
  // ignore: non_constant_identifier_names
  const Descripition(
      {super.key,
      required this.name,
      required this.descripition,
      required this.bannnerurl,
      required this.posturi,
      required this.vote,
      required this.launch_date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(48, 255, 179, 179),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannnerurl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      child: Modified_text(
                          text: '⭐ avarage rating-' + vote,
                          color: Colors.white,
                          size: 20))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Modified_text(
                  text: name != null ? name : 'just second',
                  color: Colors.white,
                  size: 20),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Modified_text(
                  text: 'releasein on:' + launch_date,
                  color: Colors.white,
                  size: 18),
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 200,
                  width: 100,
                  child: Image.network(posturi),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Container(
                    child: Modified_text(
                        text: descripition, color: Colors.white, size: 16),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
