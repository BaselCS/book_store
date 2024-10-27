import 'package:flutter/material.dart';

import 'colors.dart';

class UpBar extends StatelessWidget {
  const UpBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ModalRoute.of(context)!.settings.name != "/mainPage"
            ? InkWell(
                onTap: () {
                  Navigator.popUntil(context, (route) {
                    if (route.settings.name == "/mainPage") {
                      return true;
                    } else {
                      return false;
                    }
                  });
                },
                child: SizedBox(height: 48, child: Image.asset("assets/icon.png")))
            : SizedBox(height: 48, child: Image.asset("assets/icon.png")),
        const SizedBox(width: 24),
        const Expanded(
          child: TextField(
            cursorColor: orangeColor,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: hintColor),
              hintText: "search",
              hintStyle: TextStyle(color: hintColor),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: hintColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: hintColor),
              ),
            ),
          ),
        ),
        const SizedBox(width: 24),
        SizedBox(
          height: 48,
          child: Row(
            children: [
              ModalRoute.of(context)!.settings.name != "/list"
                  ? InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/list");
                      },
                      child: Image.asset("assets/list.png"))
                  : Image.asset("assets/list.png"),
              const SizedBox(width: 16),
              InkWell(
                  onTap: () {
                    Navigator.popUntil(context, (route) {
                      if (route.settings.name == "/") {
                        return true;
                      } else {
                        return false;
                      }
                    });
                  },
                  child: const Text("Log out", style: TextStyle(color: blackColor))),
            ],
          ),
        ),
      ],
    );
  }
}
