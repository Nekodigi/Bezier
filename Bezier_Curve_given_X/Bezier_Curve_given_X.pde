
Bezier bezier = new Bezier();
float xTolerance = EPSILON;

float markR = 20;

void setup(){
  size(500, 500);
  bezier.vertices.add(new BezierVertex(0, 250));//like vertex();
  bezier.vertices.add(new BezierVertex(100, 0));
  bezier.vertices.add(new BezierVertex(100, 400, 400, 100, 400, 500));//like quadraticVertex();
  bezier.vertices.add(new BezierVertex(500, 300, 500, 0));//like bezierVertex();
  strokeWeight(5);
  stroke(255);
  noFill();
  
}

void draw(){
  background(0);
  //ellipse(A.x, A.y, markR, markR);
  //ellipse(B.x, B.y, markR, markR);
  //ellipse(C.x, C.y, markR, markR);
  //ellipse(D.x, D.y, markR, markR);
  //bezier(A.x, A.y, B.x, B.y, C.x, C.y, D.x, D.y);
  float x = mouseX;
  float y = bezier.getYgivenX(x);
  bezier.show();
  ellipse(x, y, markR, markR);
  line(x, 0, x, height);
  line(0, y, width, y);
}
