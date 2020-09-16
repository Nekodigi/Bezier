class Bezier{
  ArrayList<BezierVertex> vertices = new ArrayList<BezierVertex>();
  
  float getYgivenX(float x){//bezier curve can't go backward when use it.
    if(x < vertices.get(0).getAX() || vertices.get(vertices.size()-1).getAX() < x)return -1;//out of range
    float t = 0;
    for(int i=0; i<vertices.size()-1; i++){
      BezierVertex A = vertices.get(i);
      BezierVertex B = vertices.get(i+1);
      if(A.getAX() <= x && x <= B.getAX()){
        switch(B.data.length){
          case 2:
            return map(x, A.getAX(), B.data[0], A.getAY(), B.data[1]);
          case 4:
            t = solveQuadraticBezier(A.getAX(), B.data[0], B.data[2], x);
            return QuadraticBezier(A.getAY(), B.data[1], B.data[3], t);
          case 6:
            t = solveCubicBezier(A.getAX(), B.data[0], B.data[2], B.data[4], x);
            return CubicBezier(A.getAY(), B.data[1], B.data[3], B.data[5], t);
        }
        break;
      }
    }
    return t;
  }
  
  void show(){
    beginShape();
    for(BezierVertex vertex : vertices){
      switch(vertex.data.length){
          case 2:
            vertex(vertex.data[0], vertex.data[1]);
            break;
          case 4:
            quadraticVertex(vertex.data[0], vertex.data[1], vertex.data[2], vertex.data[3]);
            break;
          case 6:
            bezierVertex(vertex.data[0], vertex.data[1], vertex.data[2], vertex.data[3], vertex.data[4], vertex.data[5]);
            break;
        }
    }
    endShape();
  }
}
