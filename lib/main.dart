import 'package:flutter/material.dart';

void main()
{
  runApp(
      MaterialApp(
                title: "Dyanmic list",
                home: Scaffold(
                  appBar: AppBar(title: Text("Dynamic list"),),
                  body: getListView(),
                ),
                 )

  );
}


List<String> getListResource()
{
  var items = List<String>.generate(1000, (counter)=> 'Item $counter');
  return items;
}

Widget getListView()
{
  var listItems = getListResource();
  var listView = ListView.builder
    (
      itemCount: listItems.length,
      itemBuilder: (context, index)
      {
        return ListTile(title: Text(listItems[index]),);
      }
  );

  return listView;

}

