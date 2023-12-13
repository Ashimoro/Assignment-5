
// this class is responsible for the visual appearance and duration of the particles released by the player's ship

class particles{
 PVector pos, vel;
 float duration = 255;
  
  particles(PVector spos){
   pos = new PVector(spos.x, spos.y);
   vel = PVector.random2D();
  }
  
 void update(){
    pos.add(vel);
    duration -=15;
  }
  
 void display(){
   stroke(232,143,0, duration);
   strokeWeight(2);
   fill(232,143,0,duration);
   ellipse(pos.x, pos.y+30, 5, 5);
 }
 
 boolean end(){ 
  return duration<0; 
 }
}
