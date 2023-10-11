import 'dart:convert';
import 'package:api_project/models/words_model.dart';
import 'package:api_project/resultpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {




  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 bool _isLoading = false;
  Future<void>_getData(String text)async{
    setState(() {
      _isLoading = true;
    });
    var json = await http.get(Uri.parse("https://api.datamuse.com/words?sp=${text}&qe=sp&md=frd&max=10"));
    List<Words> data = wordsFromJson(json.body);
    setState(() {
      _isLoading = false;
    });
    Navigator.push(context, CupertinoPageRoute(builder: (context)=>ResultPage(data)));
    
  }
  var tfController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Word store", style: GoogleFonts.akayaKanadaka(),),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: tfController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder()
                  ),
                ),
              ),
              OutlinedButton(
                  onPressed: _isLoading ? null :
                      (){
                _getData(tfController.text.toString());
              }, child: Text("Search"))
            ],
          )
      ),

    );
  }
}