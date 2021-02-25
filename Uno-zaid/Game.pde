import java.util.Collections;

public class Game{
  ArrayList<Player> players = new ArrayList<Player>();
  int currentPlayer = 0;
  ArrayList<Card> pile = new ArrayList<Card>();
  Card lastCard;
  boolean reversed = false;
  
  int pullUp = 0;
  CardColor pickedColor = null;
  boolean changingColor = false;
  
  int cardOffset = 0;
  int winner = -1;
  
  
  
  public Game(){
    for(int i=0;i<2;i++){
      players.add(new Player());
    }
    
    for(CardColor c : CardColor.values()){
      if(c == CardColor.BLACK){
        continue;
      }
      
      for(CardType number : numberTypes){
        pile.add(new Card(c, number));
      }
      
      pile.add(new Card(c, skip));
      pile.add(new Card(c, reverse));
      pile.add(new Card(c, plusTwo));
    }
    
    for(int i=0; i<2; i++){
      pile.add(new Card(CardColor.BLACK, changeColor));
      pile.add(new Card(CardColor.BLACK, plusFour));
    }
    
    Collections.shuffle(pile);
    
    for(int i=0; i<7; i++){
      for(Player pl : players){
         drawCard(pl);
      }
    }
    
    //lastCard = pile.remove(0);
    
    print(lastCard);
  }
  
  public Player getCurrentPlayer(){
    while(currentPlayer<0){
      currentPlayer += players.size();
    }
    return players.get(currentPlayer%players.size());
  }
  
  public void drawCard(Player player){
    player.hand.add(pile.remove(0));
  }
  
  public void changeColor(){
    changingColor = true;
  }
  
  public void draw(){
    if(winner != -1){
      textSize(60);
      text("Player" + (currentPlayer+1) + " has won!", 20, width/2);
      return;
    }
    
    if(lastCard != null){
      lastCard.draw(20, 20);
      
      if(lastCard.cardColor == CardColor.BLACK && !changingColor){
        textSize(30);
        fillColor(pickedColor);
        text(pickedColor.toString(), 20, 230);
      }
    }
    
    textSize(30);
    text("Player" + (currentPlayer+1) + "'s turn", width/3, 80);
    
    if(pullUp > 0){
      textSize(30);
      text("+" + pullUp, width/3, height/2);
    }
    
    if(changingColor){
      int hoveredColor = getHoveredColor();
      int i = 0;
      fillColor(CardColor.RED);
      rect(20 + 70*i,height/2 - (hoveredColor == i ? 20 : 0),60,80);
      i++;
      
      fillColor(CardColor.BLUE);
      rect(20 + 70*i,height/2 - (hoveredColor == i ? 20 : 0),60,80);
      i++;

      fillColor(CardColor.YELLOW);
      rect(20 + 70*i,height/2 - (hoveredColor == i ? 20 : 0),60,80);
      i++;

      fillColor(CardColor.GREEN);
      rect(20 + 70*i,height/2 - (hoveredColor == i ? 20 : 0),60,80);
    }
    
    int x = 0;
    for(Card c : getCurrentPlayer().hand){
        boolean isHovered = c == getHoveredCard();
        c.draw(20 - cardOffset + 90*x, height - (isHovered ? 220 : 200));
        x++;
    }
  }
  
  public void mouseClicked(){
    if(changingColor){
      int hoveredColor = getHoveredColor();
      if(hoveredColor != -1){
        if(hoveredColor == 0){
          pickedColor = CardColor.RED;
        }
        else if(hoveredColor == 1){
          pickedColor = CardColor.BLUE;
        }
        else if(hoveredColor == 2){
          pickedColor = CardColor.YELLOW;
        }
        else if(hoveredColor == 3){
          pickedColor = CardColor.GREEN;
        }
        changingColor = false;
        nextTurn();
      }
    }
    
    Card clickedCard = getHoveredCard();
    if(clickedCard != null && clickedCard.canPlayOn(this, lastCard)){
      getCurrentPlayer().hand.remove(clickedCard);
      if(getCurrentPlayer().hand.size() == 0){
        winner = currentPlayer;
        return;
      }
      clickedCard.type.onPlayed(game, clickedCard);
    }
  }
  
  public int getHoveredColor(){
    for(int i=0; i<=3; i++){
        int colorLeft = 20 + 70*i;
        int colorWidth = 60;
        int colorTop = height/2;
        int colorHeight = 80;
        
        if(colorLeft < mouseX && mouseX < colorLeft + colorWidth && colorTop < mouseY && mouseY < colorTop + colorHeight){
          return i;
        }
    }
    
    return -1;
  }
  
  public Card getHoveredCard(){
    int x = 0;
    for(Card c : getCurrentPlayer().hand){
        int cardLeft = 20 - cardOffset + 90*x;
        int cardWidth = 112;
        int cardTop = height-200;
        int cardHeight = 178;
        
        if(cardLeft < mouseX && mouseX < cardLeft + cardWidth && cardTop < mouseY && mouseY < cardTop + cardHeight){
          return c;
        }
        x++;
    }
    
    return null;
  }
  
  public void nextTurn(){
    if(game.reversed){
      game.currentPlayer--;
    }
    else{
      game.currentPlayer++;
    }
    
    game.currentPlayer = game.currentPlayer % game.players.size();
  }
  
  public void drawCard(){
    if(pullUp > 0){
      while(pullUp>0){
        drawCard(getCurrentPlayer());
        pullUp--;
      }
    }
    else{
      drawCard(getCurrentPlayer());
    }
    nextTurn();
  }
}
