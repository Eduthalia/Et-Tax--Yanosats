import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsFeed extends StatelessWidget {
  final String? title; // Define title as an optional parameter
  final String? notes; // Define notes as an optional parameter
  const NewsFeed({super.key, this.notes, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(0),
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
                const Icon(Icons.error, size: 30,),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title ??"",
                  style: GoogleFonts.acme(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              notes ?? // Use notes if provided, otherwise use a default message
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
