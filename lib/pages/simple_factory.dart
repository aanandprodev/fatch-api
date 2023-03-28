import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:simple_curd_api/models/user_m_1.dart';
import 'package:simple_curd_api/pages/post.dart';
import 'package:simple_curd_api/pages/update.dart';
import 'package:simple_curd_api/service/service.dart';

class SimpleFactSCREEN extends StatefulWidget {
  const SimpleFactSCREEN({Key? key}) : super(key: key);

  @override
  State<SimpleFactSCREEN> createState() => _SimpleFactSCREENState();
}

class _SimpleFactSCREENState extends State<SimpleFactSCREEN> {
  @override
  void initState() {
    super.initState();
    ApiServices().getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 120,
          ),
          const Text(
            "For factory 2",
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PostScreen()),
                );
              },
              child: Text("post")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                log('up');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpatePage()),
                );

                // var user = Datum(
                //   id: "64142641ca2b14cc84f00df9",
                //   productName: "Update",
                //   productDescription: "Adore",
                //   productPrice: "1075",
                // );
                // print(user.toString());

                // log(user.toString());

                // var response = await ApiServices()
                //     .putAPI("/${user.id}", user)
                //     .catchError((err) {});
                // if (response == null) return;
                // debugPrint('successful:');
              },
              child: const Text("Update")),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: FutureBuilder<UserModel1>(
              future: ApiServices().getUsers(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.data.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              snapshot
                                                  .data!.data[index].productName
                                                  .toString(),
                                              style: TextStyle(fontSize: 24),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              snapshot.data!.data[index]
                                                  .productPrice
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      child: Row(
                                        children: [
                                          ElevatedButton(
                                              onPressed: () async {
                                                log('1');

                                                var user = Datum(
                                                    id: snapshot
                                                        .data!.data[index].id
                                                        .toString());
                                                log(user.toString());

                                                var response =
                                                    await ApiServices()
                                                        .delete("/${user.id}")
                                                        .catchError((err) {});
                                                if (response == null) return;
                                                debugPrint('successful');
                                              },
                                              child: const Text("Delete")),
                                          SizedBox(width: 10),
                                          ElevatedButton(
                                              onPressed: () {
                                                log('up');
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        UpatePage(
                                                      id: snapshot
                                                          .data!.data[index].id
                                                          .toString(),
                                                      name: snapshot
                                                          .data!
                                                          .data[index]
                                                          .productName
                                                          .toString(),
                                                      dri: snapshot
                                                          .data!
                                                          .data[index]
                                                          .productDescription
                                                          .toString(),
                                                      price: snapshot
                                                          .data!
                                                          .data[index]
                                                          .productPrice
                                                          .toString(),
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: const Text("Update")),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text("Loading from api 2"),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
