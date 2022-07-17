import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:aea_app/providers/entreprise_provider.dart';

class ContactInfo extends StatefulWidget {
  final int id;

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
    final int entrepriseId = widget.id;

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
                onTap: () {
                  final Uri url = Uri(
                    scheme: "tel",
                    path: entrepriseModel.entrepriseList[entrepriseId].fixePhone,
                  );

                  launchUrl(url);
                },
                child: fixePhone
                    ? Text(entrepriseModel.entrepriseList[entrepriseId].fixePhone!)
                    : const SizedBox.shrink(), // Empty widget
              ),
            ),
            Expanded(
              flex: 0,
              child: InkWell(
                onTap: () {
                  final Uri url = Uri(
                    scheme: "tel",
                    path: entrepriseModel.entrepriseList[entrepriseId].fixePhone,
                  );

                  launchUrl(url);
                },
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
        fixePhone ? const SizedBox(height: 10) : const SizedBox.shrink(),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: faxNumber ? const Text("Fax :") : const SizedBox.shrink(),
            ),
            Expanded(
              flex: 2,
              child: InkWell(
                onTap: () {
                  final Uri url = Uri(
                    scheme: "tel",
                    path: entrepriseModel.entrepriseList[entrepriseId].faxNumber,
                  );

                  launchUrl(url);
                },
                child: faxNumber
                    ? Text(entrepriseModel.entrepriseList[entrepriseId].faxNumber!)
                    : const SizedBox.shrink(), // Empty widget
              ),
            ),
            Expanded(
              flex: 0,
              child: InkWell(
                onTap: () {
                  final Uri url = Uri(
                    scheme: "tel",
                    path: entrepriseModel.entrepriseList[entrepriseId].faxNumber,
                  );

                  launchUrl(url);
                },
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
        faxNumber ? const SizedBox(height: 10) : const SizedBox.shrink(),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: mobile ? const Text("Mobile :") : const SizedBox.shrink(),
            ),
            Expanded(
              flex: 2,
              child: InkWell(
                onTap: () {
                  final Uri url = Uri(
                    scheme: "tel",
                    path: entrepriseModel.entrepriseList[entrepriseId].mobile,
                  );

                  launchUrl(url);
                },
                child: mobile
                    ? Text(entrepriseModel.entrepriseList[entrepriseId].mobile!)
                    : const SizedBox.shrink(), // Empty widget
              ),
            ),
            Expanded(
              flex: 0,
              child: InkWell(
                onTap: () {
                  final Uri url = Uri(
                    scheme: "tel",
                    path: entrepriseModel.entrepriseList[entrepriseId].mobile,
                  );

                  launchUrl(url);
                },
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
        mobile ? const SizedBox(height: 10) : const SizedBox.shrink(),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: email ? const Text("Email :") : const SizedBox.shrink(),
            ),
            Expanded(
              flex: 2,
              child: InkWell(
                onTap: () {
                  final Uri url = Uri(
                    scheme: "mailto",
                    path: entrepriseModel.entrepriseList[entrepriseId].email,
                  );

                  launchUrl(url);
                },
                child: email
                    ? Text(entrepriseModel.entrepriseList[entrepriseId].email!)
                    : const SizedBox.shrink(), // Empty widget
              ),
            ),
            Expanded(
              flex: 0,
              child: InkWell(
                onTap: () {
                  final Uri url = Uri(
                    scheme: "mailto",
                    path: entrepriseModel.entrepriseList[entrepriseId].email,
                  );

                  launchUrl(url);
                },
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
        email ? const SizedBox(height: 10) : const SizedBox.shrink(),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: website ? const Text("Site Web :") : const SizedBox.shrink(),
            ),
            Expanded(
              flex: 2,
              child: InkWell(
                onTap: () {
                  final Uri url =
                      Uri.parse(entrepriseModel.entrepriseList[entrepriseId].website!);

                  launchUrl(
                    url,
                    mode: LaunchMode.inAppWebView,
                  );
                },
                child: website
                    ? Text(entrepriseModel.entrepriseList[entrepriseId].website!)
                    : const SizedBox.shrink(), // Empty widget
              ),
            ),
            Expanded(
              flex: 0,
              child: InkWell(
                onTap: () {
                  final Uri url =
                      Uri.parse(entrepriseModel.entrepriseList[entrepriseId].website!);

                  launchUrl(
                    url,
                    mode: LaunchMode.inAppWebView,
                  );
                },
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
        website ? const SizedBox(height: 10) : const SizedBox.shrink(),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: facebook ? const Text("Facebook :") : const SizedBox.shrink(),
            ),
            Expanded(
              flex: 2,
              child: InkWell(
                onTap: () {
                  final Uri url =
                      Uri.parse(entrepriseModel.entrepriseList[entrepriseId].facebook!);

                  launchUrl(
                    url,
                    mode: LaunchMode.inAppWebView,
                  );
                },
                child: facebook
                    ? const Text("Page Facebook")
                    : const SizedBox.shrink(), // Empty widget
              ),
            ),
            Expanded(
              flex: 0,
              child: InkWell(
                onTap: () {
                  final Uri url =
                      Uri.parse(entrepriseModel.entrepriseList[entrepriseId].facebook!);

                  launchUrl(
                    url,
                    mode: LaunchMode.inAppWebView,
                  );
                },
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
        facebook ? const SizedBox(height: 10) : const SizedBox.shrink(),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: youtube ? const Text("Youtube :") : const SizedBox.shrink(),
            ),
            Expanded(
              flex: 2,
              child: InkWell(
                onTap: () {
                  final Uri url =
                      Uri.parse(entrepriseModel.entrepriseList[entrepriseId].youtube!);

                  launchUrl(
                    url,
                    mode: LaunchMode.externalNonBrowserApplication,
                  );
                },
                child: youtube
                    ? const Text("Chaine Youtube")
                    : const SizedBox.shrink(), // Empty widget
              ),
            ),
            Expanded(
              flex: 0,
              child: InkWell(
                onTap: () {
                  final Uri url =
                      Uri.parse(entrepriseModel.entrepriseList[entrepriseId].youtube!);

                  launchUrl(
                    url,
                    mode: LaunchMode.externalNonBrowserApplication,
                  );
                },
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
        youtube ? const SizedBox(height: 10) : const SizedBox.shrink(),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: maps ? const Text("Google Maps :") : const SizedBox.shrink(),
            ),
            Expanded(
              flex: 2,
              child: InkWell(
                onTap: () {
                  final Uri url =
                      Uri.parse(entrepriseModel.entrepriseList[entrepriseId].maps!);

                  launchUrl(
                    url,
                    mode: LaunchMode.externalNonBrowserApplication,
                  );
                },
                child: maps
                    ? const Text("Itinéraire Google Maps")
                    : const SizedBox.shrink(), // Empty widget
              ),
            ),
            Expanded(
              flex: 0,
              child: InkWell(
                onTap: () {
                  final Uri url =
                      Uri.parse(entrepriseModel.entrepriseList[entrepriseId].maps!);

                  launchUrl(
                    url,
                    mode: LaunchMode.externalNonBrowserApplication,
                  );
                },
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
