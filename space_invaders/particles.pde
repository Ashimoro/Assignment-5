class particles{
 PVector pos, vel;
 float duration = 255;
  
  particles(PVector spos){
   pos = new PVector(spos.x, spos.y);
   vel = PVector.random2D();
  }
  
 void update(){
    pos.add(vel);
    duration -=2;
  }
  
 void display(){
   stroke(232,143,0, duration);
   strokeWeight(2);
   fill(232,143,0,duration);
   ellipse(pos.x, pos.y, 5, 5);
   println(pos.x + " " + pos.y);
 }
 
 boolean end(){
  return duration<0; 
 }
}
