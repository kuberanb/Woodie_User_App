import 'package:flutter/material.dart';
import 'package:woodie/core/colorPalettes.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text(
          'Help Center',
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: kWhiteColor,
              size: 20,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 0.01 * screenHeight,
            ),
            EachExpansionTile(
              expansionTileTitle:
                  '''How much does it cost to deliver the Product ''',
              expansionTileDescription:
                  ''' We do not charge any delivery fees for delivery of product all across India''',
            ),
            SizedBox(
              height: 0.01 * screenHeight,
            ),
            EachExpansionTile(
              expansionTileTitle:
                  'How to contact the Customer Support for any queries',
              expansionTileDescription:
                  ''' You can contact our customer support by sending a mail to support@Woodie.com and we will reply back in 1hour''',
            ),
            SizedBox(
              height: 0.01 * screenHeight,
            ),
            EachExpansionTile(
              expansionTileTitle:
                  '''How long does it take to deliver the ordered Product''',
              expansionTileDescription:
                  '''It Usually takes 3 to 7days to deliver the product and Incase of delay, We will mail you regarding the delay of delivery''',
            ),
            SizedBox(
              height: 0.01 * screenHeight,
            ),
            EachExpansionTile(
              expansionTileTitle: '''Where does Woodie Office Situated ''',
              expansionTileDescription:
                  '''Our Main Office is located at Kochi Kerala and we have sub offices in all metro cities such as Delhi,Mumbai,Kochi,Banglore,Chennai,Surat,Hydrebad''',
            ),
            SizedBox(
              height: 0.01 * screenHeight,
            ),
            EachExpansionTile(
              expansionTileTitle:
                  '''How to change the Password of Woodie App ''',
              expansionTileDescription:
                  '''You can Change the password of Woodie app by going to Sign In or Sign Out page and clicking on the Forgot Password Button and It will redirect you to a screen where you need to enter your email Address and you will get a Passoword reset Link in your mailid and by clicking it , It will redirect you to website and from there you can change your password and , Now you can login using newly set password ''',
            ),
            SizedBox(
              height: 0.01 * screenHeight,
            ),
            EachExpansionTile(
              expansionTileTitle: 'What is Woodie',
              expansionTileDescription:
                  '''Woodie is e-commerce app which mainly focuses on Furniture and household Items''',
            ),
            SizedBox(
              height: 0.01 * screenHeight,
            ),
            EachExpansionTile(
              expansionTileTitle: '''Who build this App ''',
              expansionTileDescription:
                  '''Woodie App is developed by Kuberan B , A Self-Taught Flutter Developer from Kochi,Kerala ''',
            ),
            SizedBox(
              height: 0.01 * screenHeight,
            ),
            
          ],
        ),
      ),
    );
  }
}

class EachExpansionTile extends StatelessWidget {
  String expansionTileTitle;
  String expansionTileDescription;
  EachExpansionTile(
      {super.key,
      required this.expansionTileTitle,
      required this.expansionTileDescription});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Card(
      child: ExpansionTile(
        collapsedBackgroundColor: kListTileColor,
        iconColor: kWhiteColor,
        collapsedIconColor: kWhiteColor,
        backgroundColor: kListTileColor,
        childrenPadding: EdgeInsets.symmetric(
            horizontal: 0.02 * screenWidth, vertical: 0.02 * screenWidth),
        title: Text(
          expansionTileTitle,
          textScaleFactor: 1,
          style: const TextStyle(color: kWhiteColor, fontSize: 18),
        ),
        children: [
          Text(
            expansionTileDescription,
            textScaleFactor: 1,
            style: const TextStyle(
              color: kLightWhiteColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
