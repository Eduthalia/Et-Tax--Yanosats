import 'package:flutter/material.dart';

class CustomersLists extends StatelessWidget {
  const CustomersLists({
    Key? key,
    required this.customerName,
    required this.tin,
    required this.income,
    required this.vat,
    this.backgroundColor,
    this.shadowColor,
    this.textColor,
  }) : super(key: key);

  final Color? backgroundColor;
  final String customerName;
  final String income;
  final Color? shadowColor;
  final Color? textColor;
  final String tin;
  final String vat;

  Widget _buildIconButton(IconData iconData, String data, String description) {
    return Column(
      children: [
        Text(
          description,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          icon: Icon(iconData),
          color: textColor ?? Colors.white,
          onPressed: () {},
        ),
        Text(
          data,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              color: backgroundColor ?? Colors.black,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: shadowColor ?? Colors.black.withOpacity(0.2),
                  spreadRadius: 10,
                  blurRadius: 20,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: 20,
            child: Text(
              customerName,
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 70, 40, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildIconButton(Icons.money, tin, "Tin"),
                          const SizedBox(
                            width: 50,
                          ),
                          _buildIconButton(Icons.percent, income, "Income"),
                          const SizedBox(
                            width: 50,
                          ),
                          _buildIconButton(Icons.numbers, vat, "TAX"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}
