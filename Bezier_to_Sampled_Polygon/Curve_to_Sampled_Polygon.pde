//based on these site https://en.wikipedia.org/wiki/B%C3%A9zier_curve
float spacing = 10;//distance between each points
Path path;

void setup(){
  size(500, 500);
  //fullScreen();
  path = new Path();
  path.addVertex(30, 20);
  path.addVertex(100, 100);
  //path.addVertex(200, 100);
  path.addVertex(100, 200, 200, 200);
  path.addVertex(200, 300, 300, 300, 400, 200);
  background(255);
  noFill();  //        contains ancchor
  path.sample(spacing, true);
  path.show();
}

void draw(){
  
}
