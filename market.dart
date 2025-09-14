import 'package:flutter/material.dart';
import 'package:market/storypage.dart';

class Market extends StatefulWidget {
  const Market({super.key});

  @override
  State<Market> createState() => _MarketState();
}

class _MarketState extends State<Market> {
  void openstory(){
    Navigator.push(context, MaterialPageRoute(builder: 
    (context)=>Storypage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Market",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 400,
              height: 30,
              decoration: BoxDecoration(
                color: const Color.fromARGB(74, 181, 175, 175),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.black),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'search product',
                          hintStyle: TextStyle(color: Colors.black),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        controller: TextEditingController(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        
          
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    color:Colors.red,borderRadius: BorderRadius.circular(40)
                  ),
                  child: Container(width: 10,
                  height: 10,
                  color: const Color.fromARGB(255, 54, 193, 244),),
                  
                ),
              ),
          
          
           Padding(
            padding: const EdgeInsets.only(left: 30,),
            child: Container(
              width: 170,
              height: 170,
              decoration: BoxDecoration(
                color:Colors.red,borderRadius: BorderRadius.circular(40)
              ),
              
            ),
          )
            
                ]  ),
        )
        ],
        ),
    
        
    );
  }
}
