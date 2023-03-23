import 'package:flutter/material.dart';

class FriendRequestView extends StatefulWidget {
  const FriendRequestView({super.key});

  @override
  State<FriendRequestView> createState() => _FriendRequestViewState();
}

class _FriendRequestViewState extends State<FriendRequestView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: const Text(
              'Rent Request',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans'),
            ),
          ),
          totalNotificationContainer(),
          viewNotificationRequest(),
          gridView()
        ],
      )),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      title: const FlutterLogo(
        size: 25.0,
      ),
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
        ),
        onPressed: () {},
        color: Colors.grey,
      ),
    );
  }

  Widget totalNotificationContainer() {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.grey.shade300,
            )
          ]),
      child: Column(
        children: const [
          Text(
            'Total Notifications',
            style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans'),
          ),
          Text(
            '206', //add number of total notification
            style: TextStyle(
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans'),
          ),
        ],
      ),
    );
  }

  Widget viewNotificationRequest() {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
      child: const Text(
        'Friend Request',
        style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
            fontSize: 12),
      ),
    );
  }

  Widget gridView() {
    return GridView.builder(
      itemCount: 4, // replace with the actual number of items you have
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: .9,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 8),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return gridViewItem(
          name: 'Macyl', // replace with the actual name for this item
          description:
              'Working Backend', // replace with the actual description for this item
          status: 'Responded', // replace with the actual status for this item
          image:
              'assets/logo.png', // replace with the actual image for this item
        );
      },
    );
  }

  Widget gridViewItem(
      {required String name,
      required String description,
      required String status,
      required String image}) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 120,
        maxWidth: 200,
        minHeight: 60,
        maxHeight: 200,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        elevation: 4,
        shadowColor: Colors.grey.shade100,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xFF4530B3),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: status == 'Responded'
                          ? const Color(0xFF31C911)
                          : Colors.amber,
                      border: Border.all(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 2),
              child: Text(
                description,
                style: const TextStyle(
                  color: Colors.grey,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            Text(
              status,
              style: const TextStyle(
                color: Colors.grey,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              decoration: const BoxDecoration(
                color: Color(0xFF4530B3),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
              ),
              child: const Center(
                child: Text(
                  'Response',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green)),
                    onPressed: () {},
                    child: const Text(
                      'Accept',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                          fontSize: 12.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                  width: 1.0,
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red)),
                    onPressed: () {},
                    child: const Text(
                      'Deny',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                          fontSize: 12.0),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
