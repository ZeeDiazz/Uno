//Nixi
ArrayList<OpretSpilKnapper> alleOpretSpilKnapper = new ArrayList<OpretSpilKnapper>();

class OpretSpilKnapper{
  float x;
  float y;
  int w;
  int h;
  String tekst;
  color farvePaaKnap = color(237,38,41);
  color outline = color(240, 240, 24);
  color tekstFarve = color(237, 204, 38);
  boolean selected = false;
  int value;
  
  OpretSpilKnapper(float x_, float y_, int w_, int h_, String tekst_, int value_){
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    tekst = tekst_;
    value = value_;
  }
  
  void display(){
    rectMode(CENTER); //Vi sætter rectMode og textAlign til center, så det bliver lettere at beregne koordinater. 
    textAlign(CENTER);
     
    if(selected == true){
      strokeWeight(2.5);
      stroke(outline);
    }
    
    fill(farvePaaKnap);
    rect(x,y - 7,w,h,9);
    
    fill(tekstFarve);
    text(tekst, x - 1, y);
    
    strokeWeight(1);
    noStroke();
    
    rectMode(CORNER); //Vi sætter rectMode og textAlign til corner og left, så det ikke ødelægger den resterende kode.
    textAlign(LEFT);
  }
  
  void select(Game currentGame){
    if(mouseX >= x - (w/2) && mouseY >= y - (h/2) && mouseX <= x + (w/2) && mouseY <= y + (h/2)){
      if(selected == false){
        for(int i = 0; i < alleOpretSpilKnapper.size(); i++){
          OpretSpilKnapper knap = alleOpretSpilKnapper.get(i);
          knap.selected = false;
        }
        
        selected = true; 
        
        playersAmount = this.value;
      }
    }
  }
}
//-----
