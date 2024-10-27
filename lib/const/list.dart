import 'package:book_store/const/cards.dart';
import 'package:book_store/const/colors.dart';
import 'package:book_store/const/up_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data.dart';

late ConfirmListProvider provider;

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 256, vertical: 8),
            child: Column(
              children: [
                SizedBox(height: height * 0.10, child: const UpBar()),
                SizedBox(height: height * 0.50, child: const ReservationList()),
                SizedBox(height: height * 0.75, child: const ConfirmList()),
              ],
            ),
          ),
        ));
  }
}

class ReservationList extends StatefulWidget {
  const ReservationList({super.key});

  @override
  State<ReservationList> createState() => _ReservationListState();
}

class _ReservationListState extends State<ReservationList> {
  void confirmLogic() {
    if (borrowList.isEmpty) return;
    if (borrowList.length + provider.confirmList.length > 5) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                backgroundColor: backgroundColor,
                title: const Text("Error", style: TextStyle(fontWeight: FontWeight.bold)),
                content: const Text("You can't borrow more than 5 books", style: TextStyle(fontWeight: FontWeight.w100)),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("OK", style: TextStyle(color: orangeColor)))
                ]);
          });
    } else {
      setState(() {
        for (int i = 0; i < borrowList.length; i++) {
          if (!provider.confirmList.contains(borrowList[i])) provider.addToList(borrowList[i]);
        }
        borrowList.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ConfirmListProvider>(context, listen: false);

    return Column(children: [
      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
      const Align(alignment: Alignment.centerLeft, child: Text("Reservation List :", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.30,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: borrowList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: MyCard(
                  borrowList[index],
                  length: 10,
                  titleSize: 14,
                  authorSize: 12,
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: MediaQuery.of(context).size.width * 0.04)),
      ),
      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
      ElevatedButton(
        onPressed: () {
          confirmLogic();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: orangeColor,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        ),
        child: const Text("CONFORM", style: TextStyle(color: whiteColor)),
      ),
    ]);
  }
}

class ConfirmList extends StatefulWidget {
  const ConfirmList({super.key});

  @override
  State<ConfirmList> createState() => _ConfirmListState();
}

class _ConfirmListState extends State<ConfirmList> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
      const Align(alignment: Alignment.centerLeft, child: Text("Conformed :", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
      Consumer<ConfirmListProvider>(
        builder: (BuildContext context, ConfirmListProvider value, Widget? child) {
          return SizedBox(
              height: MediaQuery.of(context).size.height * 0.60,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: MediaQuery.of(context).size.height * 0.02,
                  mainAxisSpacing: MediaQuery.of(context).size.height * 0.02,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: provider.confirmList.length,
                itemBuilder: (context, index) {
                  return InfoCard(index);
                },
              ));
        },
      ),
    ]);
  }
}

class InfoCard extends StatelessWidget {
  final int index;
  const InfoCard(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Image.asset(provider.confirmList[index].path),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Tooltip(
                  message: provider.confirmList[index].title,
                  child: Expanded(
                      child: FittedBox(
                          child: Text(truncate(provider.confirmList[index].title, 20), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold))))),
              Tooltip(
                  message: provider.confirmList[index].author,
                  child: Expanded(
                      child: FittedBox(
                          child: Text(truncate(provider.confirmList[index].author, 20), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w100))))),
              const Text("Borrow Date", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
              Text("${DateTime.now().add(const Duration(days: 6)).day}/${DateTime.now().month}/${DateTime.now().year}",
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w100)),
              const Text("Dead Line", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
              Text(
                  "${DateTime.now().add(const Duration(days: 6)).day}/${DateTime.now().add(const Duration(days: 6)).month}/${DateTime.now().add(const Duration(days: 6)).year}",
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w100)),
              const Text("Number of Days left ", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
              const Text("6 Days", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100)),
            ],
          )
        ]));
  }
}
