float QuadraticBezier(float a, float b, float c, float t){
  //return b + (1 - t)*(1 - t)*(a - b) + t*t*(c - b);
  return (1 - t)*((1 - t)*a + t*b) + t*((1 - t)*b + t*c);
}

float solveQuadraticBezier(float a, float b, float c, float x){
  return ((A.x-B.x)+sqrt(x*a - 2*x*b + x*c - a*c + b*b))/(a - 2*b + c);
}
