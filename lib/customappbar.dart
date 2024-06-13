import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SizedBox(
        width: 180,
        child: Image.asset(
          'images/sportanm.png',
          fit: BoxFit.cover,
        ),
      ),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: Color(0xFF0F0529),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(4.0),
        child: Container(
          color: Colors.purple,
          height: 4.0,
        ),
      ),
    );
  }
}
