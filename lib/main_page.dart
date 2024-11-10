import 'package:book_store/const/cards.dart';
import 'package:flutter/material.dart';

import 'const/colors.dart';
import 'const/data.dart';
import 'const/up_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  void showMsg(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: backgroundColor,
            title: const Text("Error", style: TextStyle(fontWeight: FontWeight.bold)),
            content: const Text("More Than 10000 Books"),
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
    });
  }

  @override
  Widget build(BuildContext context) {
    if (modelList.length > 10000) {
      showMsg(context);
    }

    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 128, vertical: 8),
          child: Column(
            children: [
              SizedBox(height: width * 0.1, child: const UpBar()),
              SizedBox(height: width * 0.25, child: const HeroSection()),
              SizedBox(height: width * 0.02),
              SizedBox(height: width * 0.25, child: const MostBorrowed()),
            ],
          ),
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Hero(tag: "title", child: Text("KFU Library", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold))),
            const SizedBox(height: 16),
            const Text("welcome to King Faisal University library \nwhere the learning really start.", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/viewAll");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: orangeColor,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: const Text("View All Books", style: TextStyle(color: whiteColor)),
            ),
          ],
        )),
        Expanded(flex: 2, child: Hero(tag: "image", child: Image.asset("assets/TheImage.jpg"))),
      ],
    );
  }
}

class MostBorrowed extends StatefulWidget {
  const MostBorrowed({super.key});

  @override
  State<MostBorrowed> createState() => _MostBorrowedState();
}

class _MostBorrowedState extends State<MostBorrowed> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Most Borrowed", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Hero(
          tag: "list",
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.30,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    bool isAdded = false;

                    return Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                isAdded = !isAdded;
                              });
                            },
                            child: MyCard(
                              modelList[index % modelList.length],
                              length: 10,
                              titleSize: 10,
                              authorSize: 10,
                            )));
                  },
                  separatorBuilder: (context, index) => SizedBox(width: MediaQuery.of(context).size.width * 0.01))),
        ),
      ],
    );
  }
}
