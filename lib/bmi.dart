import 'package:flutter/material.dart';


class BMI extends StatefulWidget{
  @override
  State<BMI> createState()=>_BMIState();
}

class _BMIState extends State<BMI>{

  var wt=TextEditingController();
  var htfoot=TextEditingController();
  var htinches=TextEditingController();
  var result="";
  var bgcolor=Colors.white;
  @override

  Widget build(BuildContext){
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Container(
        color: bgcolor,
        child: Center(
          child: Container(
            width: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text('Enter your Weight in Kgs: '),
                TextField(
                  controller: wt,
                  keyboardType: TextInputType.number,
                  decoration:InputDecoration(label: Text('Your Weight here (in Kgs)'),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.greenAccent),borderRadius: BorderRadius.circular(20)),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(20))
                  ),
                ),
                SizedBox(height: 10,),
                // Text('Enter your Height in Foot: ' ),
                TextField(
                  controller: htfoot,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(label:Text('Your height here(in Feet)'),
                      focusedBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.greenAccent)),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,),borderRadius: BorderRadius.circular(20))),
                ),
                // Text('Enter your Height in Inches: '),
                SizedBox(height: 10,),
                TextField(
                  controller: htinches,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(label: Text('Your height here(in inches)'),focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.greenAccent),borderRadius: BorderRadius.circular(20),),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(20))),
                ),
                ElevatedButton(onPressed: (){
                  var weights=(wt.text.toString());
                  var hfeets=(htfoot.text.toString());
                  var hinchess=(htinches.text.toString());

                  if(weights!="" && hfeets!='' && hinchess!=''){

                    var weight=int.parse(weights);
                    var hfeet=int.parse(hfeets);
                    var hinches=int.parse(hinchess);

                    var temp=hfeet*12;
                    hinches=hinches+temp;
                    var hm=hinches*2.54;
                    hm=hm/100;
                    var ans=weight/(hm*hm);
                    var msg="";
                    if(ans>25){
                      msg="You are Overweight";
                      bgcolor=Colors.orange.shade100;
                    }else if(ans<18){
                      msg="You are underweight";
                      bgcolor=Colors.red.shade100;
                    }else{
                      msg="You are Healthy";
                      bgcolor=Colors.greenAccent;
                    }

                    setState(() {
                      result="$msg\nYour BMI index is ${ans.toStringAsFixed(4)}";
                    });

                  }else{
                    setState(() {
                      result="Please enter all the values!!!";
                    });
                  }
                }, child: Text('Calculate'))
                ,
                SizedBox(height: 40,),
                Text(result,style: TextStyle(fontSize:20),)],
            ),
          ),
        ),
      ),

    );
  }
}