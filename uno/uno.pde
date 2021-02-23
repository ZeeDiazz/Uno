ArrayList<CardType> numberTypes = new ArrayList<CardType>();
CardType skip = new TypeSkip();
CardType reverse = new TypeReverse();
CardType plusTwo = new TypePlusTwo();
CardType changeColor = new TypeChangeColor();
CardType plusFour = new TypePlusFour();
Game game;

//forside kode
boolean viewForside = true;

//opret game kode
boolean viewCreateGame = false;

void setup(){
  background(55);
  size(800, 800);
  noStroke();
  
  for(int i=0; i<=9; i++){
    numberTypes.add(new TypeNumber(i)); 
  }
  
  game = new Game();
}

void draw(){
  background(55);
    //forside kode
  if(viewForside == true){
  forside();
  }
  
  if(viewForside == false && viewCreateGame == false){
  game.draw();
  }
  
  //opret spil kode
  if(viewCreateGame == true && viewForside == false){
  opretSpil();
  }
  
  //exit knappen
  fill(255,0,0);
  ellipse(760, 40, 60, 60);
  fill(0);
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
  
  if(mouseY < 45 && mouseX < 760 || mouseY < 50 && mouseX < 765){ 
    exit();
  }
  
  //opret spil knappen
  if(mouseX >= 470 && mouseY >= 365 && mouseX <= (470 + 200) && mouseY <= (365 + 50)){
    print('e');
    viewForside = false;
    viewCreateGame = true;
  }
  
  //antal spillere knapper
  for(int i = 0; i < alleOpretSpilKnapper.size(); i++){
    OpretSpilKnapper knap = alleOpretSpilKnapper.get(i);
    knap.select();
  }
  
  if(viewCreateGame == true && mouseX >= (width/2) - (300/2) && mouseY >= (height - 250) - (70/2) && mouseX <= (width/2) + (300/2) && mouseY <= (height - 250) + (70/2)){
    viewCreateGame = false;
  }
}
