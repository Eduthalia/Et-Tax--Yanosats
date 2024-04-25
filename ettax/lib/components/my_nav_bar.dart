import 'package:ettax/pages/ai_page.dart';
import 'package:ettax/pages/home_page.dart';
import 'package:ettax/pages/income.dart';
import 'package:ettax/pages/invoics_page_create.dart';
import 'package:ettax/pages/transactions_pending.dart';
import 'package:flutter/material.dart';

class MyNavBar extends StatefulWidget {
  final int index;
  final Function(int)? onIndexChanged;

  const MyNavBar({super.key, required this.index, this.onIndexChanged});

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  @override
  Widget build(BuildContext context) {
    Color unselectedColor = Colors.black;
    Color selectedColor = Color.fromARGB(255, 114, 172, 216);

    return BottomNavigationBar(
      currentIndex: widget.index,
      unselectedItemColor: unselectedColor,
      selectedItemColor: selectedColor,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.percent_outlined),
          label: 'Tax',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.summarize),
          label: 'Invoice',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.alarm_on),
          label: "Reminder",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.computer),
          label: "AI",
        ),
      ],
      onTap: (index) {
        if (widget.onIndexChanged != null) {
          widget.onIndexChanged!(index);
        }
        switch (index) {
          case 0:
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const HomePage()));
            break;
          case 1:
           Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Income()));
            break;
          case 2:
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const InvoicePage()));
            break;
          case 3:
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const TransactionPending()));
            break;
          case 4: 
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const ChatScreen()));
            break;
        }
      },
    );
  }
}
