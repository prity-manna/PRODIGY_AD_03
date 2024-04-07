import 'package:flutter/material.dart';

class Entries extends StatelessWidget {
  final List<Map<String, int>> laps;
  const Entries({required this.laps, super.key});

  @override
  Widget build(BuildContext context) => Expanded(
    child: Container(
      color: Colors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: const Text(
              "Total Laps",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: (laps.isNotEmpty)
              ? ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              primary: true,
              physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Text(
                        "#${index+1}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Text("${laps[index]['hour']}:${laps[index]['minute']}:${laps[index]['second']}:${laps[index]['millisecond']}"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 2.0),
                  color: Colors.black,
                  height: 2,
                ),
                itemCount: laps.length
              )
              : Container(
                alignment: Alignment.center,
                child: const Text(
                  "No Laps yet found",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
          ),
        ],
      ),
    ),
  );
}