
//based on this site https://stackoverflow.com/questions/7348009/y-coordinate-for-a-given-x-cubic-bezier/17546429#17546429?newreg=c073a9f1dd674d6282ff446b99046204
PVector A, B, C, D;
float xTolerance = EPSILON;

float markR = 20;

void setup(){
  size(500, 500);
  A = new PVector(0, 100);
  B = new PVector(1000, 0);
  C = new PVector(0, 400);
  D = new PVector(500, 500);
  strokeWeight(5);
  stroke(255);
  noFill();
  
}

void draw(){
  background(0);
  ellipse(A.x, A.y, markR, markR);
  ellipse(B.x, B.y, markR, markR);
  ellipse(C.x, C.y, markR, markR);
  ellipse(D.x, D.y, markR, markR);
  bezier(A.x, A.y, B.x, B.y, C.x, C.y, D.x, D.y);
  float x = float(mouseX);
  //float t = ((A.x-B.x)+sqrt(x*A.x - 2*x*B.x + x*C.x - A.x*C.x + B.x*B.x))/(A.x - 2*B.x + C.x);
  //if(t<0 || 1<t)t = ((A.x-B.x)-sqrt(x*A.x - 2*x*B.x + x*C.x - A.x*C.x + B.x*B.x))/(A.x - 2*B.x + C.x);;
  
  Compl[] answers = solveCubicBezier(A.x, B.x, C.x, D.x, x);
  for(Compl a : answers){
    if(a.y == 0){
      float y = CubicBezier(A.y, B.y, C.y, D.y, a.x);
      ellipse(x, y, markR, markR);
      line(0, y, width, y);
    }
  }
  
  line(x, 0, x, height);
}
