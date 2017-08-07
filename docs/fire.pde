int height = 600;
int width = 1000;
int unitx = width/2;
int unity = height/2;
int fire[][] = new int[unitx][unity];

void settings(){
  size(width, height);
}

void setup(){
  frameRate(60);
}

void makefire(){
  for(int i=0; i < unitx; i++){
    fire[i][0] = (int)(random(1.0)*256);
  }
  for(int x=0; x < unitx; x++){
    int x1, x2, x3;
    if(x==0) x1 = fire[unitx-1][0];
    else x1 = fire[x-1][0];
    x2 = fire[x][0];
    if(x==unitx-1) x3 = fire[0][0];
    else x3 = fire[x+1][0];
    fire[x][1] = (int)((x1+x2+x3)/3.0);
  }
  for(int y=2; y < unity; y++){
    for(int x=0; x < unitx; x++){
      int x1, x2, x3, x4;
      if(x==0) x1 = fire[unitx-1][y-1];
      else x1 = fire[x-1][y-1];
      x2 = fire[x][y-1];
      x4 = fire[x][y-2];
      if(x==unitx-1) x3 = fire[0][y-1];
      else x3 = fire[x+1][y-1];
      fire[x][y] = (int)((x1+x2+x3+x4)/4.0);
    }
  }
}

void draw(){
  background(0);
  
  makefire();
  
  for(int x=0; x < unitx; x++){
    for(int y=0; y < unity; y++){
      fill(fire[x][y], 0, 0);
      rect(5*x, height-5*(y+1), 5, 5);
    }
  }
}