//based on this site https://stackoverflow.com/questions/8217346/cubic-bezier-curves-get-y-for-given-x
//Exception handling is omitted for simplicity. If you need to be perfect please see based article.  
PVector A, B, C;

float markR = 20;

void setup(){
  size(500, 500);
  A = new PVector(0, 0);
  B = new PVector(100, 400);
  C = new PVector(500, 100);
  strokeWeight(5);
  stroke(255);
  noFill();
  
}

void draw(){
  background(0);
  ellipse(A.x, A.y, markR, markR);
  ellipse(B.x, B.y, markR, markR);
  ellipse(C.x, C.y, markR, markR);
  beginShape();
  vertex(A.x, A.y);
  quadraticVertex(B.x, B.y, C.x, C.y);
  endShape();
  float x = mouseX;
  float t = ((A.x-B.x)+sqrt(x*A.x - 2*x*B.x + x*C.x - A.x*C.x + B.x*B.x))/(A.x - 2*B.x + C.x);
  //if(t<0 || 1<t)t = ((A.x-B.x)-sqrt(x*A.x - 2*x*B.x + x*C.x - A.x*C.x + B.x*B.x))/(A.x - 2*B.x + C.x);;
  
  
  float y = (1 - t)*((1 - t)*A.y + t*B.y) + t*((1 - t)*B.y + t*C.y);
  ellipse(x, y, markR, markR);
  line(x, 0, x, height);
  line(0, y, width, y);
}
