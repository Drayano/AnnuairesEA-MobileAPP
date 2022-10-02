import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:aea_app/models/entreprise.dart';

class ContactInfo extends StatefulWidget {
  final int id;
  final EntrepriseModel entreprise;

  const ContactInfo({
    Key? key,
    required this.id,
    required this.entreprise,
  }) : super(key: key);

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  @override
  Widget build(BuildContext context) {
    final bool fixePhone =
        (widget.entreprise.fixePhone != null) && (widget.entreprise.fixePhone != "");
    final bool faxNumber =
        (widget.entreprise.faxNumber != null) && (widget.entreprise.faxNumber != "");
    final bool mobile = (widget.entreprise.mobile != null) && (widget.entreprise.mobile != "");
    final bool email = (widget.entreprise.email != null) && (widget.entreprise.email != "");
    final bool website =
        (widget.entreprise.website != null) && (widget.entreprise.website != "");
    final bool facebook =
        (widget.entreprise.facebook != null) && (widget.entreprise.facebook != "");
    final bool youtube =
        (widget.entreprise.youtube != null) && (widget.entreprise.youtube != "");
    final bool maps = (widget.entreprise.maps != null) && (widget.entreprise.maps != "");

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
                    path: widget.entreprise.fixePhone,
                  );

                  launchUrl(url);
                },
                child: fixePhone
                    ? Text(widget.entreprise.fixePhone!)
                    : const SizedBox.shrink(), // Empty widget
              ),
            ),
            Expanded(
              flex: 0,
              child: InkWell(
                onTap: () {
                  final Uri url = Uri(
                    scheme: "tel",
                    path: widget.entreprise.fixePhone,
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
                    path: widget.entreprise.faxNumber,
                  );

                  launchUrl(url);
                },
                child: faxNumber
                    ? Text(widget.entreprise.faxNumber!)
                    : const SizedBox.shrink(), // Empty widget
              ),
            ),
            Expanded(
              flex: 0,
              child: InkWell(
                onTap: () {
                  final Uri url = Uri(
                    scheme: "tel",
                    path: widget.entreprise.faxNumber,
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
                    path: widget.entreprise.mobile,
                  );

                  launchUrl(url);
                },
                child: mobile
                    ? Text(widget.entreprise.mobile!)
                    : const SizedBox.shrink(), // Empty widget
              ),
            ),
            Expanded(
              flex: 0,
              child: InkWell(
                onTap: () {
                  final Uri url = Uri(
                    scheme: "tel",
                    path: widget.entreprise.mobile,
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
                    path: widget.entreprise.email,
                  );

                  launchUrl(url);
                },
                child: email
                    ? Text(widget.entreprise.email!)
                    : const SizedBox.shrink(), // Empty widget
              ),
            ),
            Expanded(
              flex: 0,
              child: InkWell(
                onTap: () {
                  final Uri url = Uri(
                    scheme: "mailto",
                    path: widget.entreprise.email,
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
                  final Uri url = Uri.parse(widget.entreprise.website!);

                  launchUrl(
                    url,
                    mode: LaunchMode.inAppWebView,
                  );
                },
                child: website
                    ? Text(widget.entreprise.website!)
                    : const SizedBox.shrink(), // Empty widget
              ),
            ),
            Expanded(
              flex: 0,
              child: InkWell(
                onTap: () {
                  final Uri url = Uri.parse(widget.entreprise.website!);

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
                  final Uri url = Uri.parse(widget.entreprise.facebook!);

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
                  final Uri url = Uri.parse(widget.entreprise.facebook!);

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
                  final Uri url = Uri.parse(widget.entreprise.youtube!);

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
                  final Uri url = Uri.parse(widget.entreprise.youtube!);

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
                  final Uri url = Uri.parse(widget.entreprise.maps!);

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
                  final Uri url = Uri.parse(widget.entreprise.maps!);

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
