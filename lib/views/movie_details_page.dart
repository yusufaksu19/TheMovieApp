import 'package:flutter/material.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Movie Title'),
        ),
        body: Stack(
          children: [
            const FractionallySizedBox(
              heightFactor: 1.0,
              widthFactor: 1.0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://i0.wp.com/shiftdelete.net/wp-content/uploads/2020/02/yeni-spiderman-filmi-cikis-tarihi-belli-oldu.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          // Movie Picture
                          Container(
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: MediaQuery.of(context).size.width * 0.40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.vertical(),
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                            child: Image.network('https://i0.wp.com/shiftdelete.net/wp-content/uploads/2020/02/yeni-spiderman-filmi-cikis-tarihi-belli-oldu.jpg'),
                          ),
                          // Movie point
                          Container(
                            margin: const EdgeInsets.only(
                              left: 5,
                              bottom: 5,
                            ),
                            height: MediaQuery.of(context).size.height * 0.03,
                            width: MediaQuery.of(context).size.width * 0.06,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.vertical(),
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                            child: const Center(
                              child: Text('8.1'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Overview'),
                          Text('Genresfsadfs'),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
