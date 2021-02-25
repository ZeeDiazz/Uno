public class Settings{

  public void draw(){
  background(55);
  fill(255);
  textSize(100);
  text("Settings",200,150);
  
  rectMode(CENTER); 
  noStroke();
  fill(237, 38, 41);
  rect(width/2,500,200,40,9);
  rect(240,390,200,50,9);
  rect(560,390,200,50,9);
  rect(60,770,100,40,9);
  
  fill(237, 204, 38);
  textSize(20);
  text("Home",33, 775);
  textSize(30);
  text("How to play",157,400);
  text("Language",493,400);
  text("Rules",360,510);
  rectMode(CORNER);
  }
}

public class Howtoplay{
  void draw(){
    rectMode(CENTER); 
    
    fill(255);
    textSize(100);
    text("How to play",100,150);
    fill(237, 38, 41);
    rect(60,770,100,40,9);
    rect(740,770,100,40,9);
  
    fill(237, 204, 38);
    textSize(20);
    text("Home",30, 775);
    text("Next",715,775);
    
    fill(255);
    rect(width/2,300,600,120,9);
    rectMode(CORNER);
    textSize(25);
    text("Each player starts seven cards...", 105, 425);
    
     fill(2);
    textSize(25);
    text("A picture of something relatable.",200,310);   
  }
}
