import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter_tutorial_es/model/Item.dart';
import 'package:flutter_tutorial_es/detail_page.dart';
import 'package:flutter_tutorial_es/items_search.dart';

void main() {
  return runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ES',
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  //Declaro el array
  List<Item> items = List<Item>();

  Future<List<Item>> _getItems() async {
    var response =
        json.decode(await rootBundle.loadString('assets/json/flutter.json'));
    var _items = List<Item>();
    for (var i in response) {
      _items.add(Item(i['title'], i['subtitle'], i['content']));
    }
    return _items;
  }

  @override
  void initState() {
    _getItems().then((value) {
      setState(() {
        items.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Documentacion Flutter ES'),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () =>
                  showSearch(context: context, delegate: DataSearch(items)))
        ],
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return _listItem(index);
          },
          itemCount: items.length),
    );
  }

  _listItem(index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          leading: FlutterLogo(
            size: 60.0,
          ),
          title: Text(items[index].title),
          subtitle: Text(items[index].subtitle),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(item: items[index])));
          },
        ),
      ),
    );
  }
}
