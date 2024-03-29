import 'package:flutter/material.dart';

import 'package:aea_app/screens/entreprises/entreprises_list_view.dart';

searchRoute(BuildContext context, String searchText) {
  return {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EntrepriseListView(search: searchText),
      ),
    )
  };
}

Widget searchCard(
  context,
  onValueSaved,
  double width,
  TextEditingController textEditingController,
) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50.0),
    ),
    margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
      ),
      padding: const EdgeInsets.only(left: 15.0, bottom: 0.0, top: 5.0),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: width * 0.6,
            child: textField(onValueSaved, 'Recherche...', textEditingController),
          ),
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            onPressed: () => searchRoute(context, textEditingController.text),
          ),
        ],
      ),
    ),
  );
}

Widget textField(onValueSaved, String hintText, TextEditingController textEditingController) {
  return TextFormField(
    controller: textEditingController,
    keyboardType: TextInputType.text,
    onSaved: onValueSaved,
    decoration: InputDecoration(
      hintText: hintText,
      border: InputBorder.none,
    ),
  );
}

Widget icons(onCancelPressed) {
  return Row(
    children: <Widget>[
      Expanded(
        child: iconButton(
            Icons.highlight_off, "Skip", const Color.fromRGBO(246, 41, 111, 1), () {}),
      ),
      Expanded(
        child: iconButton(
            Icons.check_circle_outline, "Taking", const Color.fromRGBO(0, 230, 118, 1), () {}),
      ),
      Expanded(
        child: GestureDetector(
          onTap: () {},
          child: Column(
            children: <Widget>[
              Container(
                height: 34,
                width: 34,
                margin: const EdgeInsets.only(bottom: 3),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepOrange, width: 2.8),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Center(
                  child: Icon(
                    Icons.access_alarms,
                    size: 24.0,
                    color: Colors.deepOrange,
                  ),
                ),
              ),
              const Text(
                "Postpone",
                style: TextStyle(color: Colors.deepOrange, fontSize: 13),
              )
            ],
          ),
        ),
      ),
    ],
  );
}

Widget iconButton(icon, text, color, onPressed) {
  return GestureDetector(
    onTap: onPressed,
    child: Column(
      children: <Widget>[
        Icon(
          icon,
          size: 38,
          color: color,
        ),
        Text(
          text,
          style: TextStyle(color: color, fontSize: 13),
        )
      ],
    ),
  );
}
