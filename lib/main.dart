import 'package:flutter/material.dart';

void main()
{
  runApp(
      MaterialApp(
                title: "Dyanmic list",
                home: Scaffold(
                  appBar: AppBar(title: Text("Dynamic list"),),
                  body: getListView(),
                  floatingActionButton: FloatingActionButton(
                                                           onPressed: (){
                                                             debugPrint("clicked FAB");
                                                           },
                                                           child: Icon(Icons.add)
                                                            ),
                ),
                 )

  );
}

void showSnackBar(BuildContext context, String item)
{
  var snack_bar = SnackBar(content: Text("You tapped $item"),
                          duration: const Duration(milliseconds: 5000),
                          action: SnackBarAction(
                             label: "UNDO",
                             onPressed: (){
                                    debugPrint("pressed UNDO");
                             },
                          ),);
  Scaffold.of(context).showSnackBar(snack_bar);
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
        return ListTile(
          title: Text(listItems[index]),
          onTap: ()
          {
            showSnackBar(context, listItems[index]);
          }
                       );
      }
  );

  return listView;

}

