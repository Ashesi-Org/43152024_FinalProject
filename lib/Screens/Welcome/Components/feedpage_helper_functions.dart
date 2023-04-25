// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FeedPage extends StatelessWidget {
  FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .orderBy("created_at", descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> post =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;

              String email = post['email'] ?? 'N/A';
              String postText = post['post'] ?? 'N/A';
              String timeStamp = post['created_at'] ?? 'N/A';

              return ListTile(
                title: Text(email),
                subtitle: Text(postText),
                trailing: Text(timeStamp),
              );

              //          return Padding(
              // padding: const EdgeInsets.only(top: 40, right: 30),
              // child: Container(
              //   width: 650,
              //   height: 200,
              //   decoration: BoxDecoration(
              //     borderRadius: const BorderRadius.only(
              //       topLeft: Radius.circular(25),
              //       topRight: Radius.circular(25),
              //       bottomLeft: Radius.circular(25),
              //       bottomRight: Radius.circular(25),
              //     ),
              //     color: const Color.fromARGB(255, 255, 255, 255),
              //     boxShadow: [
              //       BoxShadow(
              //         color: const Color.fromARGB(255, 98, 98, 98).withOpacity(0.5),
              //         spreadRadius: 0,
              //         blurRadius: 2,
              //         offset: const Offset(1, 3),
              //       ),
              //     ],
              //   ),
              //   // message box contents
              //   child: Padding(
              //     padding:
              //         const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
              //     child: Container(
              //       // color: Colors.amberAccent,
              //       child: Column(children: [
              //         Container(
              //           // color: Colors.blueGrey,
              //           child: Row(
              //             children: [
              //               Padding(
              //                 padding: const EdgeInsets.only(top: 10, left: 25),
              //                 child: Row(
              //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     // user image avatar
              //                     Container(
              //                       width: 40,
              //                       height: 40,
              //                       decoration: const BoxDecoration(
              //                         shape: BoxShape.circle,
              //                         color: Color.fromRGBO(255, 244, 195, 1),
              //                       ),
              //                     ),
              //                     const SizedBox(width: 10),
              //                     Padding(
              //                       padding: const EdgeInsets.only(bottom: 20, left: 10),
              //                       child: Text(
              //                         email,
              //                         style: const TextStyle(
              //                             color: Colors.black,
              //                             fontSize: 14,
              //                             fontWeight: FontWeight.w500,
              //                             fontFamily: 'Times New Roman'),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //               Expanded(
              //                 child: Padding(
              //                   padding: const EdgeInsets.only(left: 500, bottom: 15),
              //                   child: Text(timeStamp,
              //                       style: const TextStyle(
              //                           color: Colors.black,
              //                           fontSize: 12,
              //                           fontWeight: FontWeight.w300,
              //                           fontFamily: 'Times New Roman')),
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //         Row(
              //           children: [
              //             Padding(
              //               padding: const EdgeInsets.only(top: 10, left: 25),
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.start,
              //                 children: [
              //                   Padding(
              //                     padding: const EdgeInsets.only(top: 5),
              //                     child: Text(
              //                       postText,
              //                       textAlign: TextAlign.left,
              //                       style: const TextStyle(
              //                           color: Colors.black,
              //                           fontSize: 12,
              //                           fontWeight: FontWeight.w400,
              //                           fontFamily: 'Times New Roman'),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //       ]),
              //     ),
              //   ),
              //   ),
              // );
            },
          );
        },
      ),
    );
  }
}
