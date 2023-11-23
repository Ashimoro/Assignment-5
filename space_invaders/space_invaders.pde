Starter starter_screen;
player_ship pship;
grid grid;

//   30(enemy ships), 33

float space_check=0;
int nstars = 3;


void setup() {
  size(600, 800);
  frameRate(60);
  
  
  starter_screen = new Starter();
  pship = new player_ship(width/2, height-50);
  grid = new grid (10,14,80);

}


void draw() {
  noStroke();
  
  
   starter_screen.display();
   stars();
   
   if(space_check == 1){
     background(0);
     
     play();
     stars();
     
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
