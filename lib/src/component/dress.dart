import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:starlight_relive/src/Api/getDress.dart';

class DressListPage extends StatefulWidget {
  @override
  State<DressListPage> createState() => _DressListPage();
}

class _DressListPage extends State<DressListPage> {
  late int _itemCount;
  late List<Dress> _items; 
  
  _getDressList() async {
    return await getAllDress(dotenv.env['dressesApi'].toString());
  }

  @override
  void initState(){
    super.initState();
    _items = _getDressList();
    _itemCount = _items.length;
  }

  @override
  Widget build(BuildContext context) {
    //下划线widget预定义以供复用。  
    return ListView.builder(
        itemCount: _itemCount,
        //列表项构造器
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            child: Card(
              child: Center(
                child: Text("${_items[index].cardId}")
              ),
            ),
          );
      }
    );
  }
}