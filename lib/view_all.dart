import 'package:book_store/const/up_bar.dart';
import 'package:flutter/material.dart';

import 'const/cards.dart';
import 'const/colors.dart';
import 'const/data.dart';

class ViewAll extends StatelessWidget {
  const ViewAll({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 8),
            child: Column(
              children: [
                SizedBox(height: height * 0.1, child: const UpBar()),
                Hero(tag: "list", child: SizedBox(height: height * 0.9, child: const MostBorrowed())),
              ],
            ),
          ),
        ));
  }
}

class MostBorrowed extends StatelessWidget {
  const MostBorrowed({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
          childAspectRatio: 1 / 2,
        ),
        itemCount: 21,
        itemBuilder: (BuildContext context, int index) {
          return Padding(padding: const EdgeInsets.all(8), child: MyCard(modelList[index % modelList.length]));
        });
  }
}
