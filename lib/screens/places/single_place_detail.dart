import 'package:flutter/material.dart';

class SinglePlaceDetail extends StatefulWidget {
  final String image;
  final String name;
  final String detail;

  const SinglePlaceDetail({
    Key? key,
    required this.image,
    required this.name,
    required this.detail,
  }) : super(key: key);

  @override
  State<SinglePlaceDetail> createState() => _SinglePlaceDetailState();
}

class _SinglePlaceDetailState extends State<SinglePlaceDetail> {
  bool isFavourite = false;

  _addToFavourite() {
    setState(
      () {
        isFavourite = !isFavourite;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: width,
              height: height / 2,
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(60.0),
                ),
                image: DecorationImage(
                  image: AssetImage(widget.image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Text(
                          widget.name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(74, 74, 74, .9),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: IconButton(
                          icon: Icon(
                            isFavourite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red,
                            size: 30,
                          ),
                          onPressed: _addToFavourite,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.detail,
                    style: const TextStyle(
                      fontSize: 13,
                      height: 1.6,
                      color: Color.fromRGBO(51, 51, 51, 1),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
