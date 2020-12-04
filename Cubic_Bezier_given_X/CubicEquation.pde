Compl[] solveCubicEquation(float a, float b, float c, float d){//based on this site http://www.1728.org/cubic2.htm
  float f = ((3*c/a) - (b*b/(a*a)))/3;
  float g = ((2*b*b*b/(a*a*a)) - (9*b*c/(a*a)) + (27*d/a))/27;
  float h = (g*g/4) + (f*f*f/27);
  if(h > 0){
    return cubic1Real(a, b, g, h);
  }else{
    if(f==0 && g==0 && h==0){
      return cubicAllRealEqual(a, d);
    }else{
      return cubicAllReal(a, b, g, h);
    }
  }
}

Compl[] cubic1Real(float a, float b, float g, float h){
  float R = -(g/2) + sqrt(h);
  float S = spow(R, 1./3);
  float T = -(g/2) - sqrt(h);
  float U = spow(T, 1./3);
  Compl[] result = new Compl[3];
  result[0] = new Compl((S + U) - (b/(3*a)), 0);
  result[1] = new Compl(-(S + U)/2 - (b/(3*a)), (S - U)*sqrt(3)/2); 
  result[2] = new Compl(-(S + U)/2 - (b/(3*a)), -(S - U)*sqrt(3)/2); 
  //println(R, S, T, U);
  return result;
}

Compl[] cubicAllReal(float a, float b, float g, float h){
  float i = sqrt((g*g/4) - h);
  float j = spow(i, 1./3);
  float k = acos(-(g/(2*i)));
  float L = -j;
  float M = cos(k/3);
  float N = sqrt(3)*sin(k/3);
  float P = -(b/(3*a));
  Compl[] result = new Compl[3];
  result[0] = new Compl(2*j*cos(k/3) -b/(3*a), 0);
  result[1] = new Compl(L*(M + N) + P, 0);
  result[2] = new Compl(L*(M - N) + P, 0);
  //println(i, j, k, L, M, N, P);
  return result;
}

Compl[] cubicAllRealEqual(float a, float d){
  Compl[] result = new Compl[3];
  result[0] = new Compl(-spow(d/a, 1./3), 0);
  result[1] = result[0];
  result[2] = result[0];
  return result;
}
