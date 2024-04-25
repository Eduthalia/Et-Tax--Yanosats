import 'package:ettax/components/my_nav_bar.dart';
import 'package:ettax/components/tax_page_container.dart';
import 'package:ettax/pages/customer_list.dart';
import 'package:ettax/pages/pension.dart';
import 'package:ettax/pages/with_holding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Income extends StatefulWidget {
  const Income({super.key});

  @override
  State<Income> createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  final routeMap = {
    'Income': '/Income',
    'VAT': '/vat_detail',
    'With-Holding': '/withholding_detail',
    'Pension': '/pension_detail',
  };

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
          'TAX Services',
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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 114, 172, 216)
                                .withOpacity(0.6),
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
                        "Easy to Use",
                        style: TextStyle(
                          color: Colors.black,
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
                                    icon: const Icon(Icons.money),
                                    color: Colors.black,
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const CustomerList()));
                                    },
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    "Income",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.5, // Adjust the width as needed
                                      child: const Text(
                                        "The Personal Income Tax Rate in Ethiopia stands at 35 percent. Personal Income Tax Rate in Ethiopia averaged 35.00 percent from 2006 until 2022",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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

              // TaxPageContainer(
              //   text:
              //      "The Personal Income Tax Rate in Ethiopia stands at 35 percent. Personal Income Tax Rate in Ethiopia averaged 35.00 percent from 2006 until 2022.",
              //   iconData: Icons.money,
              //   iconname: "Income",
              //   title: "Easy to Use",
              //   routeMap: routeMap,
              // ),
              GestureDetector(
                onTap: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WithHolding()));
                },
                child: TaxPageContainer(
                  text:
                      "VAT is a consumption tax that is charged on the supply of taxable goods or services made in Ethiopia and on the importation of taxable goods or services into Ethiopia.",
                  iconData: Icons.percent,
                  iconname: "VAT",
                  title: "Convient",
                  routeMap: routeMap,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WithHolding()));
                },
                child: TaxPageContainer(
                  text:
                      "The Ethiopian Taxation system has two major categories: direct and indirect taxes. All tax types in the Ethiopian tax system are described and explained as follows. ",
                  iconData: Icons.oil_barrel_outlined,
                  iconname: "With-Holding",
                  title: "Time Saving",
                  routeMap: routeMap,
                  backgroundColor: Colors.white,
                  shadowColor: Colors.black.withOpacity(0.2),
                ),
              ),
              GestureDetector(
                onTap: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Pension()));
                },
                child: TaxPageContainer(
                  text:
                      "The contributions payable to the Private Organizations Pension Fund shall, based on the employee's salary, be: By the employer, 11%; • By the employee, 7%.",
                  iconData: Icons.person_2_rounded,
                  iconname: "Pension",
                  title: "Appealing",
                  routeMap: routeMap,
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const MyNavBar(index: 1),
    );
  }
}
