import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:aea_app/providers/entreprise_provider.dart';

class ContactInfo extends StatefulWidget {
  final String id;

  const ContactInfo({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  @override
  Widget build(BuildContext context) {
    final EntrepriseProvider entrepriseModel = Provider.of<EntrepriseProvider>(context);
    final int entrepriseId = int.parse(widget.id) - 1;

    final bool fixePhone = (entrepriseModel.entrepriseList[entrepriseId].fixePhone != null) &&
        (entrepriseModel.entrepriseList[entrepriseId].fixePhone != "");
    final bool faxNumber = (entrepriseModel.entrepriseList[entrepriseId].faxNumber != null) &&
        (entrepriseModel.entrepriseList[entrepriseId].faxNumber != "");
    final bool mobile = (entrepriseModel.entrepriseList[entrepriseId].mobile != null) &&
        (entrepriseModel.entrepriseList[entrepriseId].mobile != "");
    final bool email = (entrepriseModel.entrepriseList[entrepriseId].email != null) &&
        (entrepriseModel.entrepriseList[entrepriseId].email != "");
    final bool website = (entrepriseModel.entrepriseList[entrepriseId].website != null) &&
        (entrepriseModel.entrepriseList[entrepriseId].website != "");
    final bool facebook = (entrepriseModel.entrepriseList[entrepriseId].facebook != null) &&
        (entrepriseModel.entrepriseList[entrepriseId].facebook != "");
    final bool youtube = (entrepriseModel.entrepriseList[entrepriseId].youtube != null) &&
        (entrepriseModel.entrepriseList[entrepriseId].youtube != "");
    final bool maps = (entrepriseModel.entrepriseList[entrepriseId].maps != null) &&
        (entrepriseModel.entrepriseList[entrepriseId].maps != "");

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: fixePhone ? const Text("Fixe :") : const SizedBox.shrink(),
            ),
            Expanded(
              flex: 2,
              child: InkWell(
                onTap: () {},
                child: fixePhone
                    ? Text(entrepriseModel.entrepriseList[entrepriseId].fixePhone!)
                    : const SizedBox.shrink(), // Empty widget
              ),
            ),
            Expanded(
              flex: 0,
              child: InkWell(
                onTap: () {},
                child: fixePhone
                    ? const Icon(
                        Icons.phone,
                        color: Colors.green,
                        size: 25,
                      )
                    : const SizedBox.shrink(), // Empty widget
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: faxNumber ? const Text("Fax :") : const SizedBox.shrink(),
            ),
            Expanded(
              flex: 2,
              child: InkWell(
                onTap: () {},
                child: faxNumber
                    ? Text(entrepriseModel.entrepriseList[entrepriseId].faxNumber!)
                    : const SizedBox.shrink(), // Empty widget
              ),
            ),
            Expanded(
              flex: 0,
              child: InkWell(
                onTap: () {},
                child: faxNumber
                    ? const Icon(
                        Icons.fax,
                        color: Colors.green,
                        size: 25,
                      )
                    : const SizedBox.shrink(), // Empty widget
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: mobile ? const Text("Mobile :") : const SizedBox.shrink(),
            ),
            Expanded(
              flex: 2,
              child: InkWell(
                onTap: () {},
                child: mobile
                    ? Text(entrepriseModel.entrepriseList[entrepriseId].mobile!)
                    : const SizedBox.shrink(), // Empty widget
              ),
            ),
            Expanded(
              flex: 0,
              child: InkWell(
                onTap: () {},
                child: mobile
                    ? const Icon(
                        Icons.phone_android,
                        color: Colors.green,
                        size: 25,
                      )
                    : const SizedBox.shrink(), // Empty widget
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: email ? const Text("Email :") : const SizedBox.shrink(),
            ),
            Expanded(
              flex: 2,
              child: InkWell(
                onTap: () {},
                child: email
                    ? Text(entrepriseModel.entrepriseList[entrepriseId].email!)
                    : const SizedBox.shrink(), // Empty widget
              ),
            ),
            Expanded(
              flex: 0,
              child: InkWell(
                onTap: () {},
                child: email
                    ? const Icon(
                        Icons.email,
                        color: Colors.red,
                        size: 25,
                      )
                    : const SizedBox.shrink(), // Empty widget
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: website ? const Text("Site Web :") : const SizedBox.shrink(),
            ),
            Expanded(
              flex: 2,
              child: InkWell(
                onTap: () {},
                child: website
                    ? Text(entrepriseModel.entrepriseList[entrepriseId].website!)
                    : const SizedBox.shrink(), // Empty widget
              ),
            ),
            Expanded(
              flex: 0,
              child: InkWell(
                onTap: () {},
                child: website
                    ? const Icon(
                        Icons.language,
                        color: Colors.blue,
                        size: 25,
                      )
                    : const SizedBox.shrink(), // Empty widget
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: facebook ? const Text("Facebook :") : const SizedBox.shrink(),
            ),
            Expanded(
              flex: 2,
              child: InkWell(
                onTap: () {},
                child: facebook
                    ? Text(entrepriseModel.entrepriseList[entrepriseId].facebook!)
                    : const SizedBox.shrink(), // Empty widget
              ),
            ),
            Expanded(
              flex: 0,
              child: InkWell(
                onTap: () {},
                child: facebook
                    ? const Icon(
                        Icons.facebook,
                        color: Colors.blue,
                        size: 25,
                      )
                    : const SizedBox.shrink(), // Empty widget
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: youtube ? const Text("Youtube :") : const SizedBox.shrink(),
            ),
            Expanded(
              flex: 2,
              child: InkWell(
                onTap: () {},
                child: youtube
                    ? Text(entrepriseModel.entrepriseList[entrepriseId].youtube!)
                    : const SizedBox.shrink(), // Empty widget
              ),
            ),
            Expanded(
              flex: 0,
              child: InkWell(
                onTap: () {},
                child: youtube
                    ? const Icon(
                        Icons.ondemand_video_rounded,
                        color: Colors.red,
                        size: 25,
                      )
                    : const SizedBox.shrink(), // Empty widget
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: maps ? const Text("Google Maps :") : const SizedBox.shrink(),
            ),
            Expanded(
              flex: 2,
              child: InkWell(
                onTap: () {},
                child: maps
                    ? Text(entrepriseModel.entrepriseList[entrepriseId].maps!)
                    : const SizedBox.shrink(), // Empty widget
              ),
            ),
            Expanded(
              flex: 0,
              child: InkWell(
                onTap: () {},
                child: maps
                    ? const Icon(
                        Icons.navigation_rounded,
                        color: Colors.green,
                        size: 25,
                      )
                    : const SizedBox.shrink(), // Empty widget
              ),
            ),
          ],
        ),
      ],
    );
  }
}
