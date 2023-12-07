Starter starter_screen;
player_ship pship;
grid grid;
enemy_ship[] eship1;
enemy_ship[] eship2;
lives lives;
projectile projectile;
win win;
//Milestone 1:
//skills that are done: 1, 2, 3, 4, 5, 9, 10, 11, 15, 18, 20, 30(player ship)
//skills that are not done:  30(enemy ships), 33(comet)

//milestone 2:
//Skills that are done: 6,7,8,12,13,14,16,17,28,29,34,35
//Skills that I'm not sure about: 21, 24, (I want to ask about 34 and 35 as well)

float space_check=0;
int nstars = 3;
float eship_y1 = 100; 
float eship_y2 = 40;
float eship_x, eship_speed;

ArrayList<projectile> proj = new ArrayList<projectile>();

void setup() {
  size(600, 800);
  frameRate(60);
  
  
  starter_screen = new Starter();
  win = new win();
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
     stroke(255);
    
     winscreen();
     lives.display();
  
   }
}

 
 void shoot() {
  proj.add(new projectile(pship.pos.x, pship.pos.y));
 }


void keyPressed() {
  if (key == ' ') {
    space_check = 1;
  } else if (key == 'z') {
    shoot();
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
    
  
  for (int i = 0; i < eship1.length; i++) {
    if (eship1[i] != null) {
      eship1[i].move();
      eship1[i].display();
      eship1[i].lives_check();
        }
    }
    
    
  for (int i = 0; i < eship2.length; i++) {
    if (eship2[i] != null) {
      eship2[i].move();
      eship2[i].display();
      eship2[i].lives_check();
        }
    }

  for (int i = proj.size() - 1; i >= 0; i--) {
    projectile projectile = proj.get(i);
    projectile.move();
    projectile.display();

        
    for (int es = 0; es < eship1.length; es++) {
      if (eship1[es] != null && projectile.hit(eship1[es])) {
        eship1[es] = null;
        proj.remove(i);
        break;
            }
        }

        
    for (int es = 0; es < eship2.length; es++) {
      if (eship2[es] != null && projectile.hit(eship2[es])) {
        eship2[es] = null;
        proj.remove(i);
        break;
      }
    }
  }
}

void resetEShips(){
   eship1 = new enemy_ship[15];
  for (int i = 0; i < eship1.length; i++){
    eship_x = i*30;
    eship_speed = 5;
    eship1[i] = new enemy_ship(eship_x,eship_y1,eship_speed);
   
    
    
  }
  
  eship2 = new enemy_ship[15];
  for (int i = 0; i < eship2.length; i++){
    eship_x = i*30;
    eship_speed = 5;
    eship2[i] = new enemy_ship(eship_x,eship_y2,eship_speed);
  } 
  
}

void winscreen(){
  boolean youwin = true;
  for (int i = 0; i < eship1.length; i++) {
    if (eship1[i] != null) {
     youwin = false; 
     break;
    }
  }  
  for (int i = 0; i < eship2.length; i++) {
    if (eship2[i] != null) {
     youwin = false;
     break;
    }
  }
  if (youwin) {
   win.display();
  }
}
