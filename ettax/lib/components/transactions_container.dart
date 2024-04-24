// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionContainer extends StatelessWidget {
  final IconData iconName;
  final String amount;
  final String dueDate;
  final String name;
  final Color? backgroundColor;
  final Color? shadowColor;
  final Color? textColor;
  final Color? iconColor;
  final String? dateName;

  const TransactionContainer({
    super.key,
    this.iconColor,
    required this.iconName,
    required this.amount,
    required this.dueDate,
    required this.name,
    this.backgroundColor,
    this.shadowColor,
    this.textColor,  
    this.dateName,
  });

  @override
  Widget build(BuildContext context) {
    Color _backgroundColor = backgroundColor ?? Colors.black;
    Color _shadowColor = shadowColor ?? Colors.black.withOpacity(0.2);
    Color _textColor = textColor ?? const Color.fromARGB(255, 114, 172, 216);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: _shadowColor,
              spreadRadius: 10,
              blurRadius: 20,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    iconName,
                    size: 30,
                    color: iconColor,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    dateName!,
                    style: GoogleFonts.acme(
                      textStyle: TextStyle(
                        color: _textColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "Amount",
                    style: GoogleFonts.acme(
                      textStyle: TextStyle(
                        color: _textColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "To",
                    style: GoogleFonts.acme(
                      textStyle: TextStyle(
                        color: _textColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    dueDate,
                    style: GoogleFonts.acme(
                      textStyle: TextStyle(
                        color: _textColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    amount,
                    style: GoogleFonts.acme(
                      textStyle: TextStyle(
                        color: _textColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    name,
                    style: GoogleFonts.acme(
                      textStyle: TextStyle(
                        color: _textColor,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
