import 'package:flutter/material.dart';
import 'package:flutter_tutorial_es/detail_page.dart';
import 'package:flutter_tutorial_es/model/Item.dart';
class DataSearch extends SearchDelegate<Item> {
  List<Item> items;
  List<Item> itemsDisplay = List<Item>();

  DataSearch(this.items);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query = '';
    })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    itemsDisplay = items
        .where((note) => note.title.toLowerCase().contains(query))
        .toList();
    return itemsDisplay.length == 0 ? Text('No hay Resultados ...') : ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _listItem(index, context);
        },
        itemCount: itemsDisplay.length);
  }

  _listItem(index, context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: FlutterLogo(
            size: 60,
          ),
          title: Text(itemsDisplay[index].title),
          subtitle: Text(itemsDisplay[index].subtitle),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailPage(item: itemsDisplay[index])));
          },
        ),
      ),
    );
  }
}