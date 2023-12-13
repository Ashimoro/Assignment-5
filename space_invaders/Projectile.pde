enemy_ship eship;

// this class is responsible for the bullets fired by the player
// there are not only functions responsible for movement, but also for hitting.

class projectile {
 float px,py;
 float pspeed = 10;
 
 projectile(float px, float py) {
   this.px = px;
   this.py = py;
 }
 
 void move(){
  py -= pspeed; 
 }
 
 void display() {
  fill(255,255,0);
  rect(px-5,py,10,20);
 }
 
boolean hit(enemy_ship eship) {
    return dist(px, py, eship.ex,eship.ey)<25;
}


 
}
