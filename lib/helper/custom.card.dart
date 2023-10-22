import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String image;
  final Color iconColor;
  final int value;
  final bool isWithIcon;
  final bool isWithValue;
  final double widthCard;
  final double heightCard;
  final double widthBanner;
  final double heightBanner;
  final String dekripsi;
  final Function onTap;

  const CustomCard({
    Key? key,
    this.icon = Icons.ac_unit,
    required this.title,
    this.image = "",
    this.iconColor = Colors.white,
    this.isWithIcon = true,
    this.isWithValue = true,
    this.widthCard = 200,
    this.heightCard = 100,
    this.widthBanner = 200,
    this.heightBanner = 50,
    this.value = 0,
    this.dekripsi = "",
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          Container(
              width: widthBanner,
              height: heightBanner,
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: isWithIcon
                  ? Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(7),
                          alignment: Alignment.topLeft,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              icon,
                              color: iconColor,
                            ),
                          ),
                        ),
                        SafeArea(
                          child: Text(
                            title,
                            style: TextStyle(
                              color: iconColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
          Container(
              alignment: Alignment.center,
              height: heightCard,
              width: widthCard,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: isWithValue
                  ? Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.grey[700],
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        value.toString(),
                        style: TextStyle(
                          color: iconColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : Image.asset(
                      image,
                      fit: BoxFit.cover,
                      scale: 3,
                    )),
        ],
      ),
    );
  }
}
