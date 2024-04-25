import 'package:ettax/components/faq_page.dart';
import 'package:ettax/components/my_nav_bar.dart';
import 'package:ettax/components/news_feeds.dart';
import 'package:ettax/pages/add_customer.dart';
import 'package:ettax/pages/pension.dart';
import 'package:ettax/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../services/auth_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void signOut() {
    final authService = Provider.of<AuthServices>(context, listen: false);
    authService.signout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: signOut,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 15, 10),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.person_2,
                          size: 50,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text(
                          "Hello Customer",
                          style: GoogleFonts.acme(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const Text(
                          "Welcome Back!!",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 10,
                          blurRadius: 20,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    top: 10,
                    left: 20,
                    child: Text(
                      'Quick Access',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 70, 20, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const AddCustomer()));
                                  },
                                  icon: const Icon(Icons.add),
                                  color: Colors.white,
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'Add',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SearchPage()));
                                    },
                                    icon: const Icon(Icons.search),
                                    color: Colors.white),
                                const SizedBox(height: 5),
                                const Text(
                                  'Search',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Pension()));
                                    },
                                    icon: const Icon(Icons.person),
                                    color: Colors.white),
                                const SizedBox(height: 5),
                                const Text(
                                  'Pension',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            // Column(
                            //   children: [
                            //     IconButton(
                            //         onPressed: () {},
                            //         icon: const Icon(Icons.computer_rounded),
                            //         color: Colors.white),
                            //     const SizedBox(height: 5),
                            //     const Text(
                            //       'AI',
                            //       style: TextStyle(
                            //         color: Colors.white,
                            //         fontSize: 12,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                "News Feeds ...",
                style: GoogleFonts.acme(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Local Feeds",
                style: GoogleFonts.acme(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NewsFeed(),
                      NewsFeed(),
                      NewsFeed(),
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "International Feeds",
                style: GoogleFonts.acme(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NewsFeed(),
                      NewsFeed(),
                      NewsFeed(),
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "FAQ ",
                style: GoogleFonts.acme(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            const FAQ(),
            const FAQ(),
          ],
        )),
      ),
      bottomNavigationBar: const MyNavBar(index: 0),
    );
  }
}
