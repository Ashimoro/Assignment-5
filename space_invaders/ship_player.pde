class player_ship{
  float x, y;
  
  player_ship(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void display(){
    fill (255);
    rect(x-15,y,30,30);  
    
    
    if (x == width) {
     x -= 10;
    } else if (x <= 0) {
     x += 10;
    }
  
}
  
  
  
  
  void move(){
    
  if (keyPressed) {
    if (keyCode == LEFT) {
      x -= 5;
    } else if (keyCode == RIGHT) {
      x += 5;
    }
  }
  
}

  
  
}
