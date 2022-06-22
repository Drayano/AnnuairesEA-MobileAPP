import "package:flutter/material.dart";
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

Widget nameDetails() {
  return Container(
    margin: EdgeInsets.only(bottom: 15),
    child: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(bottom: 4),
          child: Text(
            'Rachel Green',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Text('rachel@example.com'),
      ],
    ),
  );
}

Widget buttonRow(w) {
  return Container(
    width: w / 1.8,
    child: Row(
      children: <Widget>[
        Expanded(
            child: Container(
          child: Icon(FeatherIcons.bell),
        )),
        Expanded(
            child: Container(
          child: Icon(FeatherIcons.heart),
        )),
        Expanded(
            child: Container(
          child: Icon(FeatherIcons.image),
        )),
        Expanded(
            child: Container(
          child: Icon(FeatherIcons.users),
        )),
      ],
    ),
  );
}

Widget friendsRow(data) {
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.only(top: 30, left: 15, right: 15),
    height: 130,
    child: ListView.builder(
      itemCount: data.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
            margin: EdgeInsets.only(right: 8),
            child: friendView(data[index].name, data[index].image));
      },
    ),
  );
}

Widget friendView(String name, String img) {
  return Container(
      child: Column(
    children: <Widget>[
      Container(
        width: 80,
        height: 80,
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 30.0,
          backgroundImage: AssetImage('assets/friends/' + img),
        ),
      ),
      Container(
        child: Text(name),
      )
    ],
  ));
}

Widget favPlaces(data) {
  return Container(
    margin: EdgeInsets.only(top: 10, left: 15, right: 10),
    height: 160,
    child: ListView.builder(
      itemCount: data.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
            margin: EdgeInsets.only(right: 10),
            child: favThumbnail(data[index].name, data[index].image));
      },
    ),
  );
}

Widget favThumbnail(String name, String img) {
  return Container(
      child: Column(
    children: <Widget>[
      Container(
        alignment: Alignment.bottomCenter,
        width: 140,
        height: 160,
        child: Container(
          width: 140,
          padding: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: new BorderRadius.only(
                bottomLeft: const Radius.circular(10.0),
                bottomRight: const Radius.circular(10.0),
              )),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              Expanded(
                  flex: 0,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )),
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
                image: AssetImage('assets/' + img), fit: BoxFit.cover)),
      ),
    ],
  ));
}
