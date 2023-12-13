
// this class is responsible for displaying the player's current score and adding a point when the player hits an enemy ship.

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
