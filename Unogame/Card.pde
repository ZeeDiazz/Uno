public class Card{
  CardColor cardColor;
  CardType type;
  
  public Card(CardColor cardColor, CardType type){
    this.cardColor = cardColor;
    this.type = type;
  }
  
  public String toString(){
    return cardColor + " " + type.name;
  }
  
  boolean canPlayOn(Game game, Card card){
    if(card == null){
      return true;
    }
    
    if(game.pullUp > 0){
      return this.type == game.lastCard.type;
    }
    
    if (this.cardColor == CardColor.BLACK){
      return true;
    }
    
    if (this.cardColor == card.cardColor || this.type == card.type){
      return true;
    }
    
    if (card.cardColor == CardColor.BLACK && this.cardColor == game.pickedColor){
      return true;
    }

    return false;
  }
  
  void draw(int x, int y){
    fill(255);
    rect(x, y, 112, 178, 12);
    
    fillColor(cardColor);
    
    rect(x + 6, y + 6, 100, 166, 12);
    fill(255);
    textSize(10);
    text(toString(), x + 12, y + 20);
    
    pushMatrix();
    translate(x + 56, y + 89);
    rotate(0.54);
    fill(255);
    ellipse(0, 0, 82, 140);
    rotate(-0.54);
    type.draw(cardColor);
    popMatrix();
  }
    
}
