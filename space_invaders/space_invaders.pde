Starter starter_screen;
player_ship pship;
grid grid;
enemy_ship[] eship1;
enemy_ship[] eship2;
lives lives;
//Milestone 1:
//skills that are done: 1, 2, 3, 4, 5, 9, 10, 11, 15, 18, 20, 30(player ship)
//skills that are not done:  30(enemy ships), 33(comet)

//milestone 2:
//Skills that are done: 6,7,8,12,13,14,16,17,28,29,34,35
//Skills that I'm not sure about: 21, 24, (I want to ask about 34 and 35 as well)
//Ask about lives_check() function

float space_check=0;
int nstars = 3;
float eship_y1 = 100; 
float eship_y2 = 40;
float eship_x, eship_speed;

void setup() {
  size(600, 800);
  frameRate(60);
  
  
  starter_screen = new Starter();
  pship = new player_ship(width/2, height-50);
  grid = new grid (10,14,80);

  lives = new lives(3);
  
  resetEShips();

}


void draw() {
  noStroke();
  
  
   starter_screen.display();
   stars();
   
   if(space_check == 1){
     background(0);
     
     play();
     stars();
  
  lives.display();
  lives_check();
  
   }
}


void keyPressed() {
  if (keyCode == ' ') {
    space_check = 1;
  }
}


void stars(){
  fill (255);
  noStroke();
  for (int i = 0; i < nstars; i++) {
   float sx = random(width);
   float sy = random(height);
   float ssize = random(1,4);
   
   ellipse(sx,sy,ssize,ssize);
  }
}


void play(){
    grid.display();
    grid.move();
    grid.gridcolor();
    pship.display();
    pship.move();
    
  for (enemy_ship eship1 : eship1) {
    eship1.move();
    eship1.display();
  }
  
  for (enemy_ship eship2 : eship2) {
    eship2.move();
    eship2.display();
  }
  
}
void resetEShips(){
   eship1 = new enemy_ship[15];
  for (int i = 0; i < eship1.length; i++){
    eship_x = i*30;
    eship_speed = 20;
    eship1[i] = new enemy_ship(eship_x,eship_y1,eship_speed);
    
    
  }
  
  eship2 = new enemy_ship[15];
  for (int i = 0; i < eship2.length; i++){
    eship_x = i*30;
    eship_speed = 20;
    eship2[i] = new enemy_ship(eship_x,eship_y2,eship_speed);
  } 
  
}

void lives_check(){
  if (eship_y1 > height/2) {
      //lives.decrease(); I'm not sure why this function is not working.
      //resetEShips(); I think, this is happening because program thinks, that y coordinate is not moving, bacause when I'm changing > to < it's working.
    println("test test");
  }
}
