class BezierVertex{
  float[] data;
  
  BezierVertex(float ... x){
    data = x;
  }
  
  float getAX(){//get anchor x
    switch(data.length){
      case 2:
        return data[0];
      case 4:
        return data[2];
      case 6:
        return data[4];
    }
    return 0;
  }
  
  float getAY(){//get anchor Y
    switch(data.length){
      case 2:
        return data[1];
      case 4:
        return data[3];
      case 6:
        return data[5];
    }
    return 0;
  }
}
