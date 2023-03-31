import 'package:flutter/material.dart';

import '../../utils/color_constants.dart';

class HomeBottomAppBar extends StatefulWidget {
  const HomeBottomAppBar({super.key});

  @override
  _HomeBottomAppBar createState() => _HomeBottomAppBar();
}

class _HomeBottomAppBar extends State<HomeBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 5),
              child: Column(
                children: [
                  IconButton(
                    enableFeedback: false,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.home_outlined,
                      color: Color(ColorConstants.COLOR_THEME_GREEN),
                      size: 30,
                    ),
                  ),
                  const Text(
                    "Home",
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 5),
              child: Column(
                children: [
                  IconButton(
                    enableFeedback: false,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Color(ColorConstants.COLOR_THEME_GREEN),
                      size: 30,
                    ),
                  ),
                  const Text(
                    "Explore",
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 5),
              child: Column(
                children: [
                  IconButton(
                    enableFeedback: false,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Color(ColorConstants.COLOR_THEME_GREEN),
                      size: 30,
                    ),
                  ),
                  const Text(
                    "Cart",
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 5),
              child: Column(
                children: [
                  IconButton(
                    enableFeedback: false,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.price_change,
                      color: Color(ColorConstants.COLOR_THEME_GREEN),
                      size: 30,
                    ),
                  ),
                  const Text(
                    "Offer",
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 5),
              child: Column(
                children: [
                  IconButton(
                    enableFeedback: false,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.verified_user_outlined,
                      color: Color(ColorConstants.COLOR_THEME_GREEN),
                      size: 30,
                    ),
                  ),
                  const Text(
                    "Account",
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
