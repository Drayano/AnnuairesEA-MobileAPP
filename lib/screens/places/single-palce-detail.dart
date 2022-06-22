import 'package:flutter/material.dart';

class SinglePlaceDetail extends StatefulWidget {
  final String image;
  final String name;
  final String detail;
  final String country;

  SinglePlaceDetail({required this.image, required this.name, required this.detail, required this.country});

  @override
  _SinglePlaceDetailState createState() => _SinglePlaceDetailState();
}

class _SinglePlaceDetailState extends State<SinglePlaceDetail> {
  bool isFavourite = false;

  _addToFavourite() {
    setState(() {
      isFavourite = !isFavourite;
    });
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
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(60.0)),
                  image: DecorationImage(
                      image: AssetImage(widget.image), fit: BoxFit.cover)),
              child: Container(
                padding: EdgeInsets.only(top: 20),
                child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text(
                            widget.name,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(74, 74, 74, .9)),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 0,
                          child: Container(
                              child: IconButton(
                                  icon: Icon(
                                    isFavourite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                  onPressed: _addToFavourite))),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8, bottom: 12),
                    child: Text(
                      widget.country,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(112, 112, 112, 1)),
                    ),
                  ),
                  Container(
                    child: Text(widget.detail,
                        style: TextStyle(
                            fontSize: 13,
                            height: 1.6,
                            color: Color.fromRGBO(51, 51, 51, 1))),
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
