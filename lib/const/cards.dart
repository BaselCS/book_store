import 'package:book_store/const/colors.dart';
import 'package:book_store/const/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCard extends StatefulWidget {
  final Model model;
  final int length;
  final double titleSize;
  final double authorSize;
  const MyCard(
    this.model, {
    super.key,
    this.titleSize = 16,
    this.authorSize = 12,
    this.length = 20,
  });

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    ConfirmListProvider provider = Provider.of<ConfirmListProvider>(context);
    bool isAdded = borrowList.contains(widget.model) || provider.confirmList.contains(widget.model);
    Image image = isAdded ? Image.asset("assets/remove book.png") : Image.asset("assets/book.png");
    final String buttonText = isAdded ? "Remove" : "Borrow";
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(child: Tooltip(message: widget.model.title, child: Image.asset(widget.model.path))),
          const SizedBox(height: 8),
          Tooltip(
              message: widget.model.title,
              child: Expanded(
                  child: FittedBox(
                      child: Text(truncate(widget.model.title, widget.length), style: TextStyle(fontSize: widget.titleSize, fontWeight: FontWeight.bold))))),
          Tooltip(
              message: widget.model.author,
              child: Expanded(
                  child: FittedBox(
                      child: Text(truncate(widget.model.author, widget.length), style: TextStyle(fontSize: widget.authorSize, fontWeight: FontWeight.w100))))),
          widget.model.isAvailable
              ? const Text("Available", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100))
              : const Text("Not Available", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100, decoration: TextDecoration.lineThrough)),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            InkWell(
                onTap: () {
                  if (isAdded) {
                    borrowList.remove(widget.model);
                  } else {
                    borrowList.add(widget.model);
                  }
                  setState(() {
                    isAdded = !isAdded;
                  });
                },
                child: Expanded(
                  child: Container(
                      decoration: BoxDecoration(color: orangeColor, borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.fromLTRB(4, 4, 15, 4),
                      child: Center(child: Text(buttonText, style: const TextStyle(color: whiteColor, fontSize: 12)))),
                )),
            SizedBox(width: 30, child: image),
          ])
        ]));
  }
}
