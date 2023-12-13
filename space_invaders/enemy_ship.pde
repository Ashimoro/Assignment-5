lives lives2;

// this class is responsible for the appearance of enemy ships, as well as for checking where they are located

class enemy_ship{
  float ex,ey,espeed;
  
  enemy_ship(float ex, float ey, float espeed) {
    this.ex = ex;
    this.ey = ey;
    this.espeed = espeed;
  }
  
  void move(){
   ex += espeed;
   
   if (ex >= width || ex <= -20) {
      espeed *= -1;
      ey += 30;
   }
  }
  
  
  void display() {
   fill (255,0,0);
   rect (ex,ey,20,20);
   rect (ex,ey+15,-5,-20);
   rect (ex+20,ey+15,5,-20);
   
   
  }
  
  void lives_check(){
  if (ey > height-50) {
      lives.decrease(); 
      score.addition(-2000);
      resetEShips();
  }
}

}
