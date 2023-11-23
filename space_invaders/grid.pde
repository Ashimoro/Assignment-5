class grid{
  int gx,gy,gs;
  float x,y,posx,posy;
  int gc = 255;
  
  
  grid(int gx, int gy, int gs) {
   this.gx = gx;
   this.gy = gy;
   this.gs = gs;
   this.x = 0;
   this.y = 0;
   
  }
  
  
  void display(){
    for(int i1=0; i1<gx;i1++){
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
  
  
  void move(){
   y = y+2; 
   
   if (y > gs) {
    y = -80;
   }
  }
  
  
      void gridcolor(){
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
