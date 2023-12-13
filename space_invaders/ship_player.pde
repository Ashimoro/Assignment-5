
// this class is responsible for the appearance of the player's ship, its movement and the limitations of the playing field

class player_ship{
  PVector pos;
  
  player_ship(float x, float y) {
    pos = new PVector(x,y);
  }
  
  void display(){
    fill (255);
    noStroke();
    rect(pos.x-15,pos.y,30,30);  
    rect(pos.x-15,pos.y+5,-5,30);
    rect(pos.x+15,pos.y+5,5,30);
    rect(pos.x-10,pos.y+5,20,-10);
  pos.x = constrain(pos.x, 30, width-30); // restricts the player's movements not allowing them to go beyond the screen

}
  
  
  
  
  void move(){
    
  if (keyPressed) {
    if (keyCode == LEFT) {
      pos.x -= 5;
    } else if (keyCode == RIGHT) {
      pos.x += 5;
    }
  }
  engine(); // drawing a projectiles from the "Projectile" class
}

  
  
}
