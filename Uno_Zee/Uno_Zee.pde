ArrayList<CardType> numberTypes = new ArrayList<CardType>();
CardType skip = new TypeSkip();
CardType reverse = new TypeReverse();
CardType plusTwo = new TypePlusTwo();
CardType changeColor = new TypeChangeColor();
CardType plusFour = new TypePlusFour();
Game game;
Settings sets;
Howtoplay htp;

//forside kode
boolean viewForside = true;
//opret game kode
boolean viewCreateGame = false;
//setting
boolean viewSettings = false;
// how to make
boolean viewHowtoplay = false;

void setup(){
  background(55);
  size(800, 800);
  noStroke();
  
  for(int i=0; i<=9; i++){
    numberTypes.add(new TypeNumber(i)); 
  }
  
  game = new Game();
  sets = new Settings();
  htp = new Howtoplay(); 
}

void draw(){
  background(55);
   //forside kode
  if(viewForside == true){
  forside();
  }
  
  if(viewForside == false && viewCreateGame == false && viewSettings == false && viewHowtoplay == false){
  game.draw();
  }
  
  //opret spil kode
  if(viewCreateGame == true && viewForside == false && viewSettings == false && viewHowtoplay == false){
  opretSpil();
  }
  
  //settings
  if(viewSettings == true && viewCreateGame == false && viewForside == false && viewHowtoplay == false){
  sets.draw();
  }
  //how to play
  if(viewHowtoplay == true && viewCreateGame == false && viewForside == false && viewSettings == false){
  htp.draw();
  }
  
  //exit knappen
  fill(255,0,0);
  ellipse(760, 40, 60, 60);
  fill(237, 204, 38);
  textSize(22);
  text("Exit",740,45);
}

void mouseClicked() {
  game.mouseClicked();
}

void keyPressed() {
  if(key == ' '){
    game.drawCard();
  }
  else if(keyCode == RIGHT){
    game.cardOffset = min(game.cardOffset+30, (game.getCurrentPlayer().hand.size()-7)*112);
  }
  else if(keyCode == LEFT){
    game.cardOffset = max(game.cardOffset-30, 0);
  }
}


//exit knappen
  void mousePressed(){  
    //exit
    if(mouseX>= 729 && mouseY>= 11 && mouseX<=790 && mouseY<=70){
      exit();
    }
    //settings   
    if(mouseX>=720 && mouseY>=82 && mouseX<=790 && mouseY<=106){ 
      viewForside = false;
      viewCreateGame = false;
      viewSettings = true;
      viewHowtoplay = false;
  }
  
  //opret spil knappen
  if(mouseX >= 470 && mouseY >= 365 && mouseX <= (470 + 200) && mouseY <= (365 + 50)){
    print('e');
    viewForside = false;
    viewSettings = false;
    viewHowtoplay = false;
    viewCreateGame = true;
  }
  //how to play
  if(mouseX>=120 && mouseY >= 366 && mouseX<=330 && mouseY<=410){ 
      viewForside = false;
      viewCreateGame = false;
      viewSettings = false;
      viewHowtoplay = true;
  }
  //home knap
  if(mouseX>=10 && mouseY >= 755 && mouseX<=110 && mouseY<=795){
      viewForside = true;
      viewCreateGame = false;
      viewSettings = false;
      viewHowtoplay = false;
  }

  //antal spillere knapper
  for(int i = 0; i < alleOpretSpilKnapper.size(); i++){
    OpretSpilKnapper knap = alleOpretSpilKnapper.get(i);
    knap.select();
  }
  
  if(viewCreateGame == true && mouseX >= (width/2) - (300/2) && mouseY >= (height - 250) - (70/2) && mouseX <= (width/2) + (300/2) && mouseY <= (height - 250) + (70/2)){
    viewCreateGame = false;
  }
   println(mouseX,mouseY);
}
