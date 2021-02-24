void forside(){
  PImage photo;
  photo = loadImage("UNO.LOGO.png");
  photo.resize(305,255);
  image(photo,250,40);
  
  noStroke();
  fill(237, 38, 41);
  rect(130,365,200,50,9);
  rect(470,365,200,50,9); //opret game
  rect(715,78,80,30,9); // settings
  
  fill(237, 204, 38);
  textSize(30);
  text("Join Game",157,400);
  textSize(30);
  text("Create Game",477,400);
  textSize(15);
  text("Settings",725,97);
  }
  
 
