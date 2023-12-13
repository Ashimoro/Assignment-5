
// this class is responsible for creating an infinite grid in the background, as well as changing its color

class grid{
  int gx,gy,gs;
  float x,y,posx,posy;
  int gc = color(255,0,0);
  
  
  grid(int gx, int gy, int gs) {
   this.gx = gx;
   this.gy = gy;
   this.gs = gs; 
  }
  
  
  void display(){
    for(int i1=0; i1<gx;i1++){ // these loops create vertical and horizontal lines
       for(int i2=0;i2<gy;i2++){
         
         posx = i1*gs - 0.3;
         posy = y + i2*gs-80;
         
         fill(0);
         stroke (gc,55);
         strokeWeight(2);
         rect(posx,posy,gs,gs);
         
       }
      }
     }
  
  
  void move(){ // movement 
   y = y+2; 
   
   if (y > gs) { // checks if the grid is on the screen, and when it crosses a certain coordinate, it sends it up
    y = -80;
   }
  }
  
  
      void gridcolor(){ // This void is responsible for changing the color by pressing the numbers from 1 to 4.
    if (keyPressed) {
      switch(key) {
       case '1':
         gc = color(255,0,0);
         break;
       case '2':
         gc = color(0,255,0);
         break;
       case '3':
         gc = color(0,0,255);
         break;
       case '4':
         gc = 255;
         break;
      }
     }    
    }
    
}
