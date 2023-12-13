/*
Name: Max Kvitka
Course: GAME12805 Programming for Game Designers
Instructor: Kit Barry
Game name: Space Invaders: Fake edition

References:

https://processing.org/reference

https://youtu.be/_k_yRbUeVxY - I used this video to figure out how to get a player to shoot [lanes 86, 153, 200]
https://www.youtube.com/watch?v=RIdBGJbCIRE - I used this class to create a grid in the background without writing each line separately, as I did earlier [lanes 18 and 19 in GRID class]

My father - he helped me figure out how to remove a certain element from an array when hit [lanes 159, 160]. He wasn't with me when I was writing the code, but he showed me how it should work with an example of his own

Inventory skills:
1. Lane 21 in projectile class
2. Lane 20 in projectile class
3. Lane 9 in starter screen class
4. Lane 90 and 106
5. Lane 112
6. Lane 18 in ship player class
7. Lane 204
8. Lane 15 in enemy ship class
9. Lane 219
10. Lane 7, 16 and 21 in projectile class
11. Lane 94
12. Lane 112
13. Lane 231
14. Lane 207
15. Lane 45 in grid class
16. Lane 136
17. Lane 18&19 in grid class
18. Lane 48 in grid class
19.
20. Lane 271
21. Lane 24 in projectile class
22.
23. Didn't use
24. Didn't use
25.
26.
27.
28. enemy ship class
29. Lane 95
30. Lane 8 in enemy ship class
31.
32.
33. Lane 180
34. Late 86 and 87
35. Lane 135
36. Lane 161
37.
37.
38. Lane 5 in player particles class
39. Lane 14 in pacticles class
40. Didn't use
41. Lane 10 in particles class
42.
43. I never used 2D Vector class before
49. Lane 25 in projectile class

*/


// connecting classes to the main program
Starter starter_screen;
player_ship pship;
grid grid;
enemy_ship[] eship1;
enemy_ship[] eship2;
lives lives;
projectile projectile;
win win;
scoreboard score;
particles particles;

// variables that will be used in a program
float space_check=0;
int nstars = 3;
float eship_y1 = 100; 
float eship_y2 = 40;
float eship_x, eship_speed;


ArrayList<projectile> proj = new ArrayList<projectile>(); // array for bullets
ArrayList<particles> part = new ArrayList<particles>();  // array for particles that comes from the player ship

//---------------------------------------------- CORE ----------------------------------------------
void setup() {
  size(600, 800);
  frameRate(60);
  
  
  starter_screen = new Starter();
  win = new win();
  pship = new player_ship(width/2, height-50);
  grid = new grid (10,14,80);
  lives = new lives(3);
  score = new scoreboard();
  
  resetEShips(); 
  usercontrol();
}


void draw() {
  noStroke();
   starter_screen.display();
   stars();
   
   if(space_check == 1){ // checks if the player has pressed the space bar on the start screen, if so, starts the game
     background(0);
     
     play();
     stars();
     stroke(255);
    
     lives.display();
     score.display();
     
     winscreen();
     lose();
   }
}

//---------------------------------------------- GAMEPLAY ----------------------------------------------
void play(){ // main void for everything related to the gameplay
    grid.display(); //everything from lane 81 to lane 86 is required to draw some elements from the classes
    moon();
    grid.move();
    grid.gridcolor();
    pship.display();
    pship.move();
  for (int i = 0; i < eship1.length; i++) {
    if (eship1[i] != null) { // checking if the enemy ship is allive
      eship1[i].move();
      eship1[i].display();
      eship1[i].lives_check(); // if enemy ship is too close to the player, it will decrease current lives, score and reset an array 
        }
    }
    
    
  for (int i = 0; i < eship2.length; i++) { // same as previous loop, but for the second lane of enemies 
    if (eship2[i] != null) {
      eship2[i].move();
      eship2[i].display();
      eship2[i].lives_check();
        }
    }

  for (int i = proj.size() - 1; i >= 0; i--) { 
    projectile projectile = proj.get(i); // this and the next two lines of code are needed so that each element of the array moves independently of each other
    projectile.move();
    projectile.display();

        
    for (int es = 0; es < eship1.length; es++) { 
      if (eship1[es] != null && projectile.hit(eship1[es])) { // checks if the enemy ship that was hitted is allive, is yes - removing it from the array, adding score to the player and removing the bullet
       eship1[es] = null;
        proj.remove(i);
        score.addition(100);
        break;
            }
        }

        
    for (int es = 0; es < eship2.length; es++) { // same as previous loop, but for the second lane of enemies
      if (eship2[es] != null && projectile.hit(eship2[es])) {
        eship2[es] = null;
        proj.remove(i);
        score.addition(100);
        break;
      }
    }
  }
}

void resetEShips(){ // void that required to display ships and reseting when they are too close to the player
   eship1 = new enemy_ship[15]; // creates an array with 15 elements in it
  for (int i = 0; i < eship1.length; i++){
    eship_x = i*40; // the space between the ships
    eship_speed = 5; // their speed
    eship1[i] = new enemy_ship(eship_x,eship_y1,eship_speed); // creates an object in an array with the specified x,y and speed
   
    
    
  }
  
  eship2 = new enemy_ship[15]; // same, but for the second lane
  for (int i = 0; i < eship2.length; i++){
    eship_x = i*40;
    eship_speed = 5;
    eship2[i] = new enemy_ship(eship_x,eship_y2,eship_speed);
  } 
  
}

void shoot() {
  proj.add(new projectile(pship.pos.x, pship.pos.y)); // creates a bullet when player shoot
 }


void keyPressed() { // game control
  if (key == ' ') { 
    space_check = 1;
  } else if (key == 'z' || key == 'Z') {
    shoot();
  }
  
}

//---------------------------------------------- VISUAL ----------------------------------------------

void stars(){ // generates a random stars on the screen each frame
  fill (255);
  noStroke();
  for (int i = 0; i < nstars; i++) {
   float sx = random(width);
   float sy = random(height);
   float ssize = random(1,4);
   
   ellipse(sx,sy,ssize,ssize);
  }
}

void winscreen(){ // win screen
  boolean youwin = true;
  for (int i = 0; i < eship1.length; i++) { 
    if (eship1[i] != null) { // if any active enemy ship is found, youwin is set to false, indicating that the player has not yet won.
     youwin = false; 
     break;
    }
  }  
  for (int i = 0; i < eship2.length; i++) { // same, but for the second lane
    if (eship2[i] != null) {
     youwin = false;
     break;
    }
  }
  if (youwin) { // when all the enemies are destroyed, the victory screen will be displayed
   win.display();
  }
}

void lose(){ // if the player has lost all their lives, the game will be restarted
 if (lives.current == 0){
   space_check = 0;
 }
}

void engine(){ //void to create a particles that are coming from the player ship
 part.add(new particles(pship.pos)); // creates a new particle at the location of the player ship
      for (int i = part.size() - 1; i >= 0; i--) {
       particles particles = part.get(i); //retrieves the current particle from the array and updating it each frame
       particles.update();
       particles.display();
         if (particles.end()) { // if particle duration = 0, removing it from the array
           part.remove(i);
       }
     }
}


void moon(){ // a big moon on the background
 fill(144,160,144,20);
 noStroke();
 ellipse(width/2,height,550,550); 
}

void usercontrol() {
 println("Use arrows to move, 'z' to shoot and '1,2,3,4' to change grid color"); 
}
