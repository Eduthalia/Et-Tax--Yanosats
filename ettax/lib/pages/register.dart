import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQ extends StatelessWidget {
  final String? text; // Optional text parameter
  final int starsCount; // Number of stars parameter
  final String textTitle;
  const FAQ({Key? key, this.text, required this.starsCount, required this.textTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          const Divider(
            color: Colors.grey,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Rate:",
                  style: GoogleFonts.acme(
                    color: Color.fromARGB(255, 126, 182, 238),
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                // Generate stars based on starsCount
                Row(
                  children: List.generate(
                    starsCount,
                    (index) => const Icon(Icons.star, color: Colors.yellow),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(
              textTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              text ??
                  "There's no need to have more than one app for breaking news, local news, world news, and more. Instead, you can use a news aggregator or news feed app to read news from the sources that matter most to you.Here are some of the best news apps for iPhone users to try.",
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
        ],
      ),
    );
  }
}
