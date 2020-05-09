import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isCross=true;  
  String msg;
  int flag=0;
  List<String> gamestate;

  AssetImage cross=AssetImage("images/cross.png");
  AssetImage circle=AssetImage("images/circle.png");
  AssetImage edit=AssetImage("images/edit.png");

  //Initialize the box with empty
  @override
  void initState()
  {
    super.initState();
    this.gamestate=["empty",
    "empty",
    "empty",
    "empty",
    "empty",
    "empty",
    "empty",
    "empty",
    "empty"];
    this.msg=" ";

  }

  //Play Game Method
  playgame(int index)
  {
    if(this.gamestate[index]=="empty")
    {
      setState(() {
        if(this.isCross)
        {
          this.gamestate[index]="cross";
        }
        else
        {
          this.gamestate[index]="circle";
        }
        this.isCross=!this.isCross;
        this.checkwin();
        if(this.flag==1)
        {
          Future.delayed(const Duration(milliseconds: 1000), () {



  setState(() {
    this.resetgame();
  });

});
        }
        
      });
      
    }
  }


  //Reset Game Method



  resetgame()
  {
    setState(() {
      this.gamestate=["empty",
    "empty",
    "empty",
    "empty",
    "empty",
    "empty",
    "empty",
    "empty",
    "empty",];
    this.msg="";
    this.isCross=true;
    this.flag=0;
    });
    
  }


  //Get Image method 
  AssetImage getImage(String val)
  {
    switch(val)
    {
      case ('empty'):
      return edit;
      break;
      case ('cross'):
      return cross;
      break;
      case ("circle"):
      return circle;
      break;
    }
  }


  //check win logic method
  checkwin()
  {
    if((gamestate[0]!='empty') && gamestate[0]==gamestate[1] && gamestate[1]==gamestate[2] )
    {
      setState(()
      {
        this.msg='${this.gamestate[0]} Wins';
        this.flag=1;
      });

    }
    else if((gamestate[0]!='empty') && gamestate[0]==gamestate[4] && gamestate[4]==gamestate[8] )
    {
       setState(()
      {
        this.msg='${this.gamestate[0]} Wins';
        this.flag=1;
      });
    }
    else if((gamestate[3]!='empty') && gamestate[3]==gamestate[4] && gamestate[4]==gamestate[5] )
    {
       setState(()
      {
        this.msg='${this.gamestate[3]} Wins';
        this.flag=1;
      });
    }
    else if((gamestate[6]!='empty') && gamestate[6]==gamestate[7] && gamestate[7]==gamestate[8] )
    {
       setState(()
      {
        this.msg='${this.gamestate[6]} Wins';
        this.flag=1;
      });
      
    }
    else if((gamestate[0]!='empty') && gamestate[0]==gamestate[3] && gamestate[3]==gamestate[6] )
    {
       setState(()
      {
        this.msg='${this.gamestate[0]} Wins';
        this.flag=1;
      });
      
    }
    else if((gamestate[1]!='empty') && gamestate[1]==gamestate[4] && gamestate[4]==gamestate[7] )
    {
       setState(()
      {
        this.msg='${this.gamestate[1]} Wins';
        this.flag=1;
      });
      
    }
    else if((gamestate[2]!='empty') && gamestate[2]==gamestate[5] && gamestate[5]==gamestate[8] )
    {
       setState(()
      {
        this.msg='${this.gamestate[2]} Wins';
        this.flag=1;
      });
    }
    else if((gamestate[2]!='empty') && gamestate[2]==gamestate[4] && gamestate[4]==gamestate[6] )
    {
       setState(()
      {
        this.msg='${this.gamestate[2]} Wins';
        this.flag=1;
      });
    }
    
    else if(!gamestate.contains("empty"))
    {
      setState(() {
        this.msg='Game Draw';
        this.flag=1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic-Tac-Toe'),
      ),
      body:Column(
        mainAxisAlignment:MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[
          Expanded(
            child:GridView.builder(padding:EdgeInsets.all(12.0),gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 1.0,crossAxisSpacing: 10.0,mainAxisSpacing: 10.0),
            itemCount: this.gamestate.length,itemBuilder: (context,i)=>SizedBox(
              width:100.0,
              height:100.0,
              child:MaterialButton(onPressed: (){
                this.playgame(i);
              }
              ,child:Image(image:this.getImage(this.gamestate[i])))

            ),
            
            ),

          ),
         Container(
           padding:EdgeInsets.all(20.0),
           child:Text(this.msg,
           style: TextStyle(fontSize:20.0,
           fontWeight:FontWeight.bold),)
         ),
         MaterialButton(onPressed:(){
           this.resetgame();
         } ,color: Color(0XFFFFC0CB),
         height: 50.0,
         minWidth: 250.0,
         child:Text("Reset",style:TextStyle(color:Colors.black45,fontWeight: FontWeight.bold,)))
         ,
         Container(
           padding:EdgeInsets.all(20.0),
           child:Text("Tic-Tac-Toe-Game By Shiv",style: TextStyle(fontSize:18.0,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),)
         )
        ],
      )


    );
      
    
  }
}