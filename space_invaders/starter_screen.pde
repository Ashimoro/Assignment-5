
// starter screen

class Starter{
 void display(){
   
  background(0);
   
  textAlign(CENTER);
  textSize(24);
  fill(255,0,0);
  
  text("Space Invaders", width/2, height/2);
  text("Cheap Fake edition!", width/2, height/2+25);
  
  textSize(16);
  text("Press 'SPACE' to start.", width/2, height/2 + 75);
 }
}
