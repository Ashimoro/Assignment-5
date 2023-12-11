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
  pos.x = constrain(pos.x, 30, width-30); 

}
  
  
  
  
  void move(){
    
  if (keyPressed) {
    if (keyCode == LEFT) {
      pos.x -= 5;
    } else if (keyCode == RIGHT) {
      pos.x += 5;
    }
  }
  engine();
}

  
  
}
