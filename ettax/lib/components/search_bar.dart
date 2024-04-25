import 'package:flutter/material.dart';

class SearchBarCustom extends StatefulWidget {
  final Function(String)?
      onUpdateSearchKey; // Make the callback function optional
  const SearchBarCustom({super.key, this.onUpdateSearchKey});

  @override
  // ignore: library_private_types_in_public_api
  _SearchBarCustomState createState() => _SearchBarCustomState();
}

class _SearchBarCustomState extends State<SearchBarCustom> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 380,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(241, 235, 235, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              onChanged: (value) {
                // Call the callback function if it's provided
                widget.onUpdateSearchKey?.call(value);
              },
              decoration: const InputDecoration(
                hintText: "Search Here",
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
