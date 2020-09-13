import 'package:flutter/material.dart';
import 'package:flutter_tutorial_es/model/Item.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class DetailPage extends StatelessWidget {
  final Item item;

  const DetailPage({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: HtmlWidget(
              item.content,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
          )
        ],
      ),
    );
  }
}

const HTML = """

""";
