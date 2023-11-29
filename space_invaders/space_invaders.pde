Starter starter_screen;
player_ship pship;
grid grid;
enemy_ship[] eship;
//Milestone 1:
//skills that are done: 1, 2, 3, 4, 5, 9, 10, 11, 15, 18, 20, 30(player ship)
//skills that are not done:  30(enemy ships), 33(comet)

//milestone 2:
//Skills that are done: 6,7,8,12,13,14,16,17

float space_check=0;
int nstars = 3;
float eship_y = 100; 
float eship_x, eship_speed;

void setup() {
  size(600, 800);
  frameRate(60);
  
  
  starter_screen = new Starter();
  pship = new player_ship(width/2, height-50);
  grid = new grid (10,14,80);

  eship = new enemy_ship[10];
  for (int i = 0; i < eship.length; i++){
    eship_x = i*30;
    eship_speed = 2;
    eship[i] = new enemy_ship(eship_x,eship_y,eship_speed);
  }

}


void draw() {
  noStroke();
  
  
   starter_screen.display();
   stars();
   
   if(space_check == 1){
     background(0);
     
     play();
     stars();

  for (enemy_ship eship : eship) {
    eship.move();
    eship.display();
  }
  
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
}
