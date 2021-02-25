public enum CardColor{
  RED,
  YELLOW,
  GREEN,
  BLUE,
  BLACK
}

void fillColor(CardColor c){
    if(c == CardColor.RED){
      fill(236, 26, 35);
    }
    else if(c == CardColor.YELLOW){
      fill(254, 222, 0);
    }
    else if(c == CardColor.GREEN){
      fill(0, 165, 79);
    }
    else if(c == CardColor.BLUE){
      fill(0, 149, 217);
    }
    else{
      fill(0);
    }
}
