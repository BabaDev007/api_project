import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/words_model.dart';
import 'package:google_fonts/google_fonts.dart';
class ResultPage extends StatelessWidget {
  final List<Words>data;

  ResultPage(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Results"),
      ),
      body: Scrollbar(
        child: ListView.separated(
            itemBuilder: (context, int index){
              return ListTile(
                title: Text(data[index].word, style: GoogleFonts.aldrich(),),
                subtitle:
                // Text(data[index].score.toString())
                // Text(data[index].defs![0])
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: data[index].defs!.length,
                      itemBuilder: (context, int i){
                    return Text("${i+1}.${data[index].defs![i]}", style: GoogleFonts.albertSans(),);
                  }),
                )
                ,
              );
            },
            separatorBuilder: (context, int index){
            return Divider(indent: 20,);},
            itemCount: data.length),
      ),

    );
  }
}
