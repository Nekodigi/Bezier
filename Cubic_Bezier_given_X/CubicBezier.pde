float CubicBezier(float a, float b, float c, float d, float t){
  return (1 - t)*QuadraticBezier(a, b, c, t) + t*QuadraticBezier(b, c, d, t);
}

Compl[] solveCubicBezier(float p0, float p1, float p2, float p3, float x){
  p0 -= x;
  p1 -= x;
  p2 -= x;
  p3 -= x;
  
  return solveCubicEquation(
    p3 - 3*p2 + 3*p1 - p0,
    3*p2 - 6*p1 + 3*p0,
    3*p1 - 3*p0,
    p0
  );
}

//float solveCubicBezier(float a, float b, float c, float d, float x){
//  //we could do something less stupid, but since the x is monotonic
//  //increasing given the problem constraints, we'll do a binary search.

//  //establish bounds
//  float lower = 0;
//  float upper = 1;
//  float percent = (upper + lower) / 2;

//  //get initial x
//  float xc = CubicBezier(a, b, c, d, percent);

//  //loop until completion
//  while(abs(x - xc) > xTolerance) {
//    if(x > xc) 
//      lower = percent;
//    else 
//      upper = percent;

//    percent = (upper + lower) / 2;
//    xc = CubicBezier(a, b, c, d, percent);
//  }
//  //we're within tolerance of the desired x value.
//  //return the y value.
//  return percent;
//}
