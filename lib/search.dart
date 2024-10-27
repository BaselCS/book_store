import 'package:book_store/const/cards.dart';
import 'package:book_store/const/colors.dart';
import 'package:book_store/const/data.dart';
import 'package:book_store/const/up_bar.dart';
import 'package:flutter/material.dart';

List<Model> searchList = [];

class SearchPage extends StatelessWidget {
  final String quarry;
  const SearchPage(this.quarry, {super.key});

  @override
  Widget build(BuildContext context) {
    searchList = modelList
        .where((element) => element.title.toLowerCase().contains(quarry.toLowerCase()) || element.author.toLowerCase().contains(quarry.toLowerCase()))
        .toList();
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 8),
            child: Column(
              children: [
                SizedBox(height: height * 0.1, child: const UpBar()),
                Text("$quarry :", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
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
        itemCount: searchList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(padding: const EdgeInsets.all(8), child: MyCard(searchList[index % searchList.length]));
        });
  }
}
