
// class that is responsible for players lives in the top left corner

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
 
  void decrease() { // function to decrease player lives 
     if (current > 0) {
      current--; 
     }
  }
  
}
