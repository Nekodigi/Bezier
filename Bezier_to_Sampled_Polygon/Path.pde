class Path{
  ArrayList<Vertex> vertices = new ArrayList<Vertex>();//curve vertex
  ArrayList<PVector> sampledPs = new ArrayList<PVector>();//sampled evenly spaced points(polygon)
  
  
  void addVertex(float ... data){
    vertices.add(new Vertex(data));
  }
  
  void sample(float spacing, boolean containsAnchor){
    //calculate evenly spaced points https://www.youtube.com/watch?v=d9k97JemYbM
    float resolution = 1;//higher valkue to get better points
    sampledPs = new ArrayList<PVector>();
    PVector previousP = vertices.get(0).anchor();
    sampledPs.add(previousP);//add start point
    for(int i = 1; i<vertices.size(); i++){
      Vertex vertex = vertices.get(i);
      switch(vertex.data.length){
        case 2://when line
          previousP = linearSampling(previousP, vertex.anchor(), spacing);
          break;
        case 4://when 1 control point bezier(quadratic)
          Bezier bezier = new Bezier(previousP, vertex);
          float controlNetLength = PVector.dist(previousP, vertex.ctrl1()) + PVector.dist(vertex.ctrl1(), vertex.anchor());
          float estimatedLength = PVector.dist(previousP, vertex.anchor()) + controlNetLength/2;
          int divisions = int(estimatedLength*resolution*10);
          for(float t = 0; t < 1; t+= 1./divisions){
            PVector pointOnCurve = bezier.P(t);
            previousP = linearSampling(previousP, pointOnCurve, spacing);
          }
          break;
        case 6://when 2 control point bezier
          bezier = new Bezier(previousP, vertex);
          controlNetLength = PVector.dist(previousP, vertex.ctrl1()) + PVector.dist(vertex.ctrl1(), vertex.ctrl2()) + PVector.dist(vertex.ctrl2(), vertex.anchor());
          estimatedLength = PVector.dist(previousP, vertex.anchor()) + controlNetLength/2;
          divisions = int(estimatedLength*resolution*10);
          for(float t = 0; t < 1; t+= 1./divisions){
            PVector pointOnCurve = bezier.P(t);
            previousP = linearSampling(previousP, pointOnCurve, spacing);
          }
          break;        
      }
      if(containsAnchor){
        previousP = vertex.anchor();//use when want exact edge, but some points are collided
        sampledPs.add(previousP);
      }
    }
  }
  
  PVector linearSampling(PVector A, PVector B, float spacing){//sampled point on AB but, not contains A and B
    float dstSinceLastEvenPoint = PVector.dist(A, B);//add distance between two vertex
    while(dstSinceLastEvenPoint >= spacing){
      float overshootDst = dstSinceLastEvenPoint - spacing;
      PVector newEvenlySpacedPoint = PVector.add(B, PVector.sub(A, B).setMag(overshootDst));//liner interpolate
      sampledPs.add(newEvenlySpacedPoint);
      dstSinceLastEvenPoint = overshootDst;
      A = newEvenlySpacedPoint.copy();
    }
    return A;//return last sampled point
  }
  
  void show(){
    beginShape();
    for(Vertex v : vertices){
      vertex(v.data[0], v.data[1]);
      if(v.data.length>=4)vertex(v.data[2], v.data[3]);
      if(v.data.length>=6)vertex(v.data[4], v.data[5]);
    }
    endShape();
    //show ground truth
    beginShape();
    for(Vertex v : vertices){
      switch(v.data.length){
        case 2:
          vertex(v.data[0], v.data[1]);
          break;
        case 4:
          quadraticVertex(v.data[0], v.data[1], v.data[2], v.data[3]);
          break;
        case 6:
          bezierVertex(v.data[0], v.data[1], v.data[2], v.data[3], v.data[4], v.data[5]);
          break;
      }
    }
    endShape();
    //show sampled point
    for(PVector p : sampledPs){
      ellipse(p.x, p.y, spacing, spacing);
    }
  }
}
