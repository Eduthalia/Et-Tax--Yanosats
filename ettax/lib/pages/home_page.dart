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
              padding: const EdgeInsets.all(10),
              child: Text(
                "Local Feeds",
                style: GoogleFonts.acme(
                  fontSize: 25,
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
                      NewsFeed(title: "Tax Evasion", notes: "Meanwhile, in Ethiopia, taxpayers evade their taxable income by supporting fictitious documents, overstating their expenditures, and not using reliable invoices (Gashaw and Ayalsew, 2019; Manaye et al., 2020; Mengistu et al., 2022)",),
                      NewsFeed(title: "Tax App Controversises", notes: "The Federal Democratic Republic of Ethiopia (FDRE) House of Peoples' Representative has amended Excise Tax Proclamation number 1186/2020 and issued Excise Tax (Amendment) Proclamation No. 1287/2023.",),
                      NewsFeed(title: "Tax goes un-paid", notes: "The Personal Income Tax Rate in Ethiopia stands at 35 percent. Personal Income Tax Rate in Ethiopia averaged 35.00 percent from 2006 until 2022, reaching an all time high of 35.00 percent in 2007 and a record low of 35.00 percent in 2007.",),
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "International Feeds",
                style: GoogleFonts.acme(
                  fontSize: 25,
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
                      NewsFeed(title: "International Tax Rule", notes: "International Tax Rule. International tax rules apply to income companies earn from their overseas operations and sales. Tax treaties between countries determine which country collects tax revenue, and anti-avoidance rules are put in place to limit gaps ",),
                      NewsFeed(title: "Global Tax Rule ", notes: "In its simplest form, the OECD's global minimum tax proposal involves paying a 'top-up tax' at the level of the parent company if income made further down the ownership chain has been taxed below the global minimum rate.",),
                      NewsFeed(title: "Highest Tax Rate ", notes: "Ivory Coast. The country with beach resorts, rainforests, and a French-colonial legacy levies a massive 60% personal income tax – the highest in the world.",),
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
            const FAQ(textTitle: "What are the Challenges of tax Compliance In Ethiopia?",  text: "The major challenges of tax compliance in Ethiopia are the complexity of the tax system, inefficiency of tax authorities, lack of tax knowledge and awareness, negative perception of taxpayers, a negative act of tax assessors, absence of tax training, lack of transparency of tax system, arbitrary estimation of taxes.", starsCount: 2),
            const FAQ(textTitle: "What are the factors affecting tax collection in Ethiopia?", text: "The main conclusions drawn from this study are disposal income, interest rate infla- tion rate, and export have significant impact on tax collection, Unemployment rate and govern- ment expenditure are insignificant variables affecting tax revenue.", starsCount: 4,),
          ],
        )),
      ),
      bottomNavigationBar: const MyNavBar(index: 0),
    );
  }
}
