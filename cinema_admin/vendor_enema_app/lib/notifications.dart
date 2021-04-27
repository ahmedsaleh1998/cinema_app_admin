import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Notifications extends StatefulWidget {
  @override
  _notificationsState createState() => _notificationsState();
}

class _notificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(0, 73, 83, 1.0),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Notifications')
                  .orderBy('id')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) return Text('Error:${snapshot.error}');
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(
                        child: Text(
                      'Loading .....',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ));
                  default:
                    return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (BuildContext context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 90,
                                  height:
                                      MediaQuery.of(context).size.height / 6,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: NetworkImage(snapshot
                                              .data.docs[index]
                                              .data()['image']))),
                                  // child: Text(''),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 10,
                                        height: 10,
                                        child: Text(''),
                                      ),
                                      Text(
                                          'Movie Title:(${snapshot.data.docs[index].data()['movie_title']})'),
                                      Text(
                                          'User:(${snapshot.data.docs[index].data()['user_email']})'),
                                      Text(
                                          'Action State:(${snapshot.data.docs[index].data()['state']})'),
                                      Text(
                                          'Chair Number:(${snapshot.data.docs[index].data()['number_of_chair']})'),
                                    ],
                                  ),
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                      size: 40,
                                    ),
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection('Notifications')
                                          .doc(snapshot.data.docs[index]
                                              .data()['id'])
                                          .delete();
                                    })
                              ],
                            ),
                          ),
                        );
                      },
                    );
                }
              }),
        ));
  }
}
