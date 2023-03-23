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
              'Friend Request',
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                '206',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans'),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF4530B3).withOpacity(.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'View Detail',
              style: TextStyle(
                  color: Color(0xFF4530B3),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans'),
            ),
          )
        ],
      ),
    );
  }

  Widget viewNotificationRequest() {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Friend Request',
            style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
                fontSize: 12),
          ),
          Text(
            'View All',
            style: TextStyle(
                color: Color(0xFF4530B3),
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
                fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget gridView() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const ScrollPhysics(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: .9,
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 8),
          primary: true,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          shrinkWrap: true,
          children: [
            gridViewItem(
                name: 'Macyl',
                description: 'Working Backend',
                status: 'Responded',
                image: 'assets/logo.png'),
            gridViewItem(
                name: 'Truc',
                description: 'Working FrontEnd',
                status: 'Not Responded',
                image: 'assets/17.jpg'),
            gridViewItem(
                name: 'Macyl',
                description: 'Working Backend',
                status: 'Responded',
                image: 'assets/logo.png'),
            gridViewItem(
                name: 'Truc',
                description: 'Working FrontEnd',
                status: 'Not Responded',
                image: 'assets/17.jpg'),
            gridViewItem(
                name: 'Macyl',
                description: 'Working Backend',
                status: 'Responded',
                image: 'assets/logo.png'),
            gridViewItem(
                name: 'Truc',
                description: 'Working FrontEnd',
                status: 'Not Responded',
                image: 'assets/17.jpg'),
            gridViewItem(
                name: 'Macyl',
                description: 'Working Backend',
                status: 'Responded',
                image: 'assets/logo.png'),
            gridViewItem(
                name: 'Truc',
                description: 'Working FrontEnd',
                status: 'Not Responded',
                image: 'assets/17.jpg'),
            gridViewItem(
                name: 'Macyl',
                description: 'Working Backend',
                status: 'Responded',
                image: 'assets/logo.png'),
            gridViewItem(
                name: 'Truc',
                description: 'Working FrontEnd',
                status: 'Not Responded',
                image: 'assets/17.jpg'),
            gridViewItem(
                name: 'Macyl',
                description: 'Working Backend',
                status: 'Responded',
                image: 'assets/logo.png'),
            gridViewItem(
                name: 'Truc',
                description: 'Working FrontEnd',
                status: 'Not Responded',
                image: 'assets/17.jpg'),
          ],
        ),
      ),
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
          ],
        ),
      ),
    );
  }
}
