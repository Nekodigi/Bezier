class Compl{//complex number
  float x, y;
  Compl(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  String toString(){
    return "("+str(x)+","+str(y)+")";
  }
  
  Compl powt(float value){//return this^value
    float angle = atan2(y, x);
    float mag = sqrt(x*x + y*y);
    float rangle = angle*value;
    float rmag = pow(mag, value);
    return new Compl(cos(rangle)*rmag, sin(rangle)*rmag);
  }
  
  Compl add(Compl target){
    return new Compl(x+target.x, y+target.y);
  }
  
  Compl add(float target){
    return new Compl(x+target, y);
  }
  
  Compl sub(Compl target){
    return new Compl(x-target.x, y-target.y);
  }
  
  Compl sub(float target){
    return new Compl(x-target, y);
  }
}
