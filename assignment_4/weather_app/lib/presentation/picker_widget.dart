import 'package:flutter/material.dart';

dataPicker(BuildContext context, List<dynamic> dataBunch,
    {required String title, Function(dynamic)? onSelect}) {
  List<dynamic> dataToShow = dataBunch;
  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text(title),
            insetPadding: EdgeInsets.symmetric(horizontal: 32),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"))
            ],
            //  content: SizedBox(height: 500,child: Container()),
            content: SizedBox(
              height: 500,
              width: 0,
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (search) {
                      if (search.isEmpty) {
                        dataToShow = dataBunch;
                      } else
                        dataToShow = dataBunch
                            .where((element) => element.toString().toLowerCase() == search.toLowerCase())
                            .toList();
                      setState(() {});
                    },
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      filled: true,
                      hintStyle: new TextStyle(color: Colors.grey[800]),
                      hintText: "Search",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (_, i) => GestureDetector(
                        onTap: () {
                          onSelect!(dataToShow[i]);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(dataToShow[i].toString()),
                        ),
                      ),
                      separatorBuilder: (_, i) => Divider(),
                      itemCount: dataToShow.length,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
