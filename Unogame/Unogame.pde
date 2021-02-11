ArrayList<CardType> numberTypes = new ArrayList<CardType>();
CardType skip = new TypeSkip();
CardType reverse = new TypeReverse();
CardType plusTwo = new TypePlusTwo();
CardType changeColor = new TypeChangeColor();
CardType plusFour = new TypePlusFour();
Game game;


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
  game.draw();
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

  void mousePressed(){  
    if(mouseY<45 && mouseX<760 || mouseY<50 && mouseX<765){ 
    exit();
  }
}
