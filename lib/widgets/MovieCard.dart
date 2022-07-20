import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: Image.network('https://productimages.hepsiburada.net/s/6/1500/9706412834866.jpg')),
              Container(
                margin: const EdgeInsets.only(
                  left: 5,
                  bottom: 5,
                ),
                height: MediaQuery.of(context).size.height * 0.03,
                width: MediaQuery.of(context).size.width * 0.06,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Center(child: Text('10')),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.03,
            width: MediaQuery.of(context).size.width * 0.30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(),
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 3, top: 3),
              child: Text('Spiderman'),
            ),
          ),
        ],
      ),
    );
  }
}
