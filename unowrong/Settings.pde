public class Settings{

  public void draw(){
  background(55);
  fill(255);
  textSize(130);
  text("Settings",138,150);
  
  rectMode(CENTER); 
  noStroke();
  fill(237, 38, 41);
  rect(width/2,500,200,50,9);
  rect(240,390,200,50,9);
  rect(560,390,200,50,9);
  
  fill(237, 204, 38);
  textSize(30);
  text("How to play",157,400);
  textSize(30);
  text("Language",477,400);
  textSize(30);
  text("Rules",360,510);
  rectMode(CORNER);
  }
}
public class Howtoplay{

  void draw(){
    rectMode(CENTER); 
    
    fill(255);
    textSize(130);
    text("How to play",13,150);
 
    
    fill(255);
    rect(width/2,300,600,120,9);
    rectMode(CORNER);
    textSize(15);
    text("Each player starts seven cards...", 105, 400);
    
     fill(2);
    textSize(30);
    text("Beautifull PICTURREEEE",220,310);

  }
}
