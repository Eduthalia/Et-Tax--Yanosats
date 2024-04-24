import 'package:flutter/material.dart';

class TaxPageContainer extends StatelessWidget {
  final String text;
  final IconData iconData;
  final String iconname;
  final String title;
  final Map<String, String> routeMap;
  final Color? backgroundColor;
  final Color? shadowColor;

  const TaxPageContainer({
    Key? key,
    required this.text,
    required this.iconData,
    required this.iconname,
    required this.title,
    required this.routeMap,
    this.backgroundColor,
    this.shadowColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.black; // Default text color
    if (backgroundColor != null && shadowColor != null) {
      // If background and shadow colors are provided, change text color
      textColor = Colors.white; // Change text color to white
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              color: backgroundColor ??
                  Colors
                      .white, // Use provided background color or default to white
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: shadowColor ??
                      const Color.fromARGB(255, 114, 172, 216).withOpacity(
                          0.6), // Use provided shadow color or default to a color
                  spreadRadius: 10,
                  blurRadius: 20,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: 20,
            child: Text(
              title,
              style: TextStyle(
                color: textColor, // Use determined text color
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
                    InkWell(
                      onTap: () {
                        // Retrieve the route name based on the icon name
                        final routeName = routeMap[iconname];
                        if (routeName != null) {
                          Navigator.pushNamed(context, routeName);
                        }
                      },
                      child: Column(
                        children: [
                          IconButton(
                            icon: Icon(iconData),
                            color: textColor, // Use determined text color
                            onPressed: () {},
                          ),
                          const SizedBox(height: 5),
                          Text(
                            iconname,
                            style: TextStyle(
                              color: textColor, // Use determined text color
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width *
                                0.5, // Adjust the width as needed
                            child: Text(
                              text,
                              style: TextStyle(
                                color: textColor, // Use determined text color
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
    );
  }
}
