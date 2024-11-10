import 'package:flutter/material.dart';

import 'const/colors.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Row(
        children: [
          const LongUI(),
          SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: double.infinity,
              child: Hero(tag: "image", child: Image.asset("assets/TheImage.jpg", fit: BoxFit.fill))),
        ],
      ),
    );
  }
}

class LongUI extends StatefulWidget {
  const LongUI({super.key});

  @override
  State<LongUI> createState() => _LongUIState();
}

class _LongUIState extends State<LongUI> {
  String id = "";
  String password = "";
  bool isPasswordHidden = false;

  void check() {
    if (id == "222456789" && password == "123456789") {
      Navigator.pushNamed(context, "/mainPage");
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: backgroundColor,
            title: const Text("Error", style: TextStyle(fontWeight: FontWeight.bold)),
            content: const Text("Invalid ID or Password"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK", style: TextStyle(color: orangeColor)),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    SizedBox sizedBox = SizedBox(
      height: height * 0.05,
    );
    return SizedBox(
      width: width / 2,
      height: height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 128, vertical: 64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Hero(
              tag: "title",
              child: Text(
                "KFU Library",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            sizedBox,
            TextField(
              cursorColor: orangeColor,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.assignment_ind_rounded, color: hintColor),
                  hintText: "ID",
                  hintStyle: TextStyle(color: hintColor),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: hintColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: hintColor),
                  )),
              onChanged: (value) {
                id = value;
              },
              onSubmitted: (value) {
                check();
              },
            ),
            sizedBox,
            TextField(
              cursorColor: orangeColor,
              obscureText: !isPasswordHidden,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline_rounded, color: hintColor),
                  suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
                      child: isPasswordHidden == true ? const Icon(Icons.visibility, color: hintColor) : const Icon(Icons.visibility_off, color: hintColor)),
                  hintText: "Password",
                  hintStyle: const TextStyle(color: hintColor),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: hintColor),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: hintColor),
                  )),
              onChanged: (value) {
                password = value;
              },
              onSubmitted: (value) => check(),
            ),
            sizedBox,
            Center(
              child: SizedBox(
                width: width * 0.23,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(orangeColor),
                  ),
                  onPressed: () {
                    check();
                  },
                  child: const Text("Log In", style: TextStyle(color: whiteColor)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
