int height = 250;
int width = 250;
int fire[][] = new int[width/5][height/5];

void settings(){
  size(width, height);
}

void setup(){
  frameRate(30);
}

void makefire(){
  for(int i=0; i < width/5; i++){
    fire[i][0] = (int)(random(1.0)*256);
  }
  for(int y=1; y < height/5; y++){
    for(int x=0; x < width/5; x++){
      int x1, x2, x3;
      if(x==0) x1 = fire[width/5][y-1];
      else x1 = fire[x-1][y-1];
      x2 = fire[x][y-1];
      if(x==width/5) x3 = fire[0][y-1];
      else x3 = fire[x+1][y-1];
      fire[x][y] = (int)((x1+x2+x3)/3.0);
    }
  }

  for(int y=0; y < height/5; y++){
    for(int x=0; x < width/5; x++){

}

void draw(){
  background(0);
  
  makefire();
  
  fill(255,0,0);
  for(int x=0; x < width/5; x++){
    for(int y=0; y < height/5; y++){
      rect(5*x, height-5*(y+1), 5, 5);
    }
  }
}