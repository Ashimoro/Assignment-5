class scoreboard{
   int currentscore;
   
   scoreboard() {
     currentscore = 0;
   }
   
   void addition(int bonus){
     currentscore += bonus;
   }
   
   void display() {
    fill (255);
    textSize(24);
    textAlign(TOP,RIGHT);
    text("Score: " + currentscore, width -130, 40);
   }
   
}
