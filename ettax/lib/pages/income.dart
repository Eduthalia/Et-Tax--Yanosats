import 'package:ettax/components/my_nav_bar.dart';
import 'package:flutter/material.dart';

import 'income_form.dart';

class Income extends StatefulWidget {
  const Income({super.key});

  @override
  State<Income> createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  String selectedButton = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text(
          'Income',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                      top: 10,
                      left: 20,
                      child: Text(
                        'Easy Use',
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
                                      setState(() {
                                        selectedButton = 'Income';
                                      });
                                    },
                                    icon: const Icon(Icons.money),
                                    color: Colors.white,
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    'Icome',
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
                                        setState(() {
                                          selectedButton = 'VAT';
                                        });
                                      },
                                      icon: const Icon(Icons.percent),
                                      color: Colors.white),
                                  const SizedBox(height: 5),
                                  const Text(
                                    'VAT',
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
                                        setState(() {
                                          selectedButton = 'With-Holding';
                                        });
                                      },
                                      icon:
                                          const Icon(Icons.oil_barrel_outlined),
                                      color: Colors.white),
                                  const SizedBox(height: 5),
                                  const Text(
                                    'With-Holding',
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
                                        setState(() {
                                          selectedButton = 'Pension';
                                        });
                                      },
                                      icon: const Icon(Icons.person_2_rounded),
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
              if (selectedButton == 'Income') const IcomeForm()
            ],
          ),
        ),
      ),
      bottomNavigationBar: const MyNavBar(index: 1),
    );
  }
}
