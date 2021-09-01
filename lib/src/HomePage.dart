import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import './Api/changelog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  var _jpVer = '';
  int _selectedIndex = 1;
  _getLastestVersion() async {
    String result;
    String api = dotenv.env['latestApi'].toString();
    result = await getLatestVer(api);
    setState(() {
      _jpVer = result;
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[],
      ),
      bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.art_track), label: '舞台少女'),
        BottomNavigationBarItem(icon: Icon(Icons.auto_awesome_mosaic), label: '礼装'),
        BottomNavigationBarItem(icon: Icon(Icons.admin_panel_settings), label:'账号')
      ],
      currentIndex: _selectedIndex,
      fixedColor: Colors.yellow
      ),
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            new Text('$_jpVer.'),
            new ElevatedButton(onPressed: _getLastestVersion, child: new Text('Get latest Jp version'))
          ]
        )
      ),
    );
  }
  void _onBottomBarTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
}