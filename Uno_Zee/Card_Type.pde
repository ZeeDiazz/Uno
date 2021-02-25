public class CardType{
  String name;
  
  public CardType(String name){
    this.name = name;
  }
  
  void onPlayed(Game game, Card card){
    game.lastCard = card;
    game.nextTurn();
  }
  
  void draw(CardColor cardColor){
      fillColor(cardColor);
  }
}

public class TypeNumber extends CardType{
  int number;
  
  public TypeNumber(int number){
    super("number " + number);
    this.number = number;
  }
  
  public void draw(CardColor cardColor){
    super.draw(cardColor);
    textSize(64);
    text(String.valueOf(number), -20, 20);
  }
}

public class TypeSkip extends CardType{
  public TypeSkip(){
    super("skip");
  }
  
  void onPlayed(Game game, Card card){
    game.lastCard = card;
    
    if(game.reversed){
      game.currentPlayer -= 2;
    }
    else{
      game.currentPlayer += 2;
    }
    
    game.currentPlayer %= game.players.size();
  }
  
  public void draw(CardColor cardColor){
    super.draw(cardColor);
    circle(0, 0, 60);
    fill(255);
    circle(0, 0, 45);
    super.draw(cardColor);
    rotate(0.6);
    rect(-3.25, -27.5, 7.5, 55);
  }
}

public class TypeReverse extends CardType{
  public TypeReverse(){
    super("reverse");
  }
  
  void onPlayed(Game game, Card card){
    if(game.players.size()>2){
      game.reversed = !game.reversed;
      super.onPlayed(game, card);
    }
    else{
      game.lastCard = card;
    }
  }
  
  public void draw(CardColor cardColor){
    super.draw(cardColor);
    pushMatrix();
    
    translate(10, -15);
    rotate(0.55);
    scale(1.5);
    triangle(0, -10, -10, 0, 10, 0);
    rect(-2.5, 0, 5.0, 20);
    rect(2.5, 10, 5.0, 20);
    triangle(5, 40, -5, 30, 15, 30);

    popMatrix();

    //arc(0, 0, 40, 40, HALF_PI, HALF_PI*3, OPEN);
  }
}

public class TypePlusTwo extends CardType{
  public TypePlusTwo(){
    super("+2");
  }
  
  void onPlayed(Game game, Card card){
    super.onPlayed(game, card);
    game.pullUp += 2;
  }
  
  public void draw(CardColor cardColor){
    super.draw(cardColor);
    textSize(64);
    text("+2", -48, 20);
  }
}

public class TypeChangeColor extends CardType{
  public TypeChangeColor(){
    super("change color");
  }
  
  void onPlayed(Game game, Card card){
    game.lastCard = card;
    game.changeColor();
  }
  
  public void draw(CardColor cardColor){
    super.draw(cardColor);
    pushMatrix();
    scale(3.0);
    rotate(0.3);
    fillColor(CardColor.RED);
    rect(-10,-10,10,10);
    fillColor(CardColor.BLUE);
    rect(0,-10,10,10);
    fillColor(CardColor.YELLOW);
    rect(-10,0,10,10);
    fillColor(CardColor.GREEN);
    rect(0,0,10,10);
    popMatrix();
  }
}

public class TypePlusFour extends CardType{
  public TypePlusFour(){
    super("+4");
  }
  
  void onPlayed(Game game, Card card){
    game.lastCard = card;
    game.pullUp += 4;
    game.changeColor();
  }
  
  public void draw(CardColor cardColor){
    super.draw(cardColor);
    
    pushMatrix();
    scale(3.0);
    rotate(0.3);
    fillColor(CardColor.RED);
    rect(-10,-10,10,10);
    fillColor(CardColor.BLUE);
    rect(0,-10,10,10);
    fillColor(CardColor.YELLOW);
    rect(-10,0,10,10);
    fillColor(CardColor.GREEN);
    rect(0,0,10,10);
    popMatrix();
    
    textSize(64);
    fill(0);
    text("+4", -48, 20);
  }
}
