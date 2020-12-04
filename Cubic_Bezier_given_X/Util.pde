float sign(float x){
  return x >= 0 ? 1 : -1;
}

float spow(float x, float y){//calculate power with same sign
  return sign(x)*pow(abs(x), y);
}
