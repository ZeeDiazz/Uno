boolean knapperLavet = false; 

void opretSpil() {

  textAlign(CENTER);
  fill(255);
  textSize(50);
  text("Game Setup", (width/2), 150);
  
  textSize(20);
  text("Amount of players:", 160, 300);

  if(knapperLavet == false){
     for(int i = 1; i <= 9; i++){
      OpretSpilKnapper knap = new OpretSpilKnapper((i*(35+20) + ((width/2) - 150)), (300), 35, 35, str(i+1));
      alleOpretSpilKnapper.add(knap);
      
      if(i == 9){
        knapperLavet = true;
      }
    }
  }
  
  for(int i = 0; i < alleOpretSpilKnapper.size(); i++){
    OpretSpilKnapper knap = alleOpretSpilKnapper.get(i);
    knap.display();
  }
  
  rectMode(CENTER);
  textAlign(CENTER);
  
  fill(237, 38, 41);
  rect((width/2), (height - 250), 300, 70, 9);
  
  textSize(45);
  fill(237, 204, 38);
  //text("Confirm", (width/2), (height - 235)); //<>//
  
  //confirm knappen i opret spil 
  //if(viewCreateGame == true) {
  //  if(viewCreateGame == true && mouseX >= (width/2) - (300/2) && mouseY >= (height - 250) - (70/2) && mouseX <= (width/2) + (300/2) && mouseY <= (height - 250) + (70/2)){
  //  viewCreateGame = false;
  // }
  //}
  
  rectMode(CORNER);
  textAlign(LEFT);
}
