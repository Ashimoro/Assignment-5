class lives {
 
  int max, current;
  
  lives(int max){
   this.max = max;
   this.current = max;
  }
  
  void display(){
      textSize(24);
      fill (255);
      text("Lives: " + current, 50, 40);
  }
 
  void decrease() {
     if (current > 0) {
      current--; 
     }
  }
  
}
