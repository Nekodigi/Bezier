PVector P(float t){
  PVector result = new PVector();
  for(int i = 0; i < B.size(); i++){
    result.add(PVector.mult(B.get(i), J(B.size()-1, i, t)));
  }
  return result;
}

float J(int n, int i, float t){
  float b = binomial(n, i);
  return b*pow(t, i)*pow(1-t, n-i);
}

int binomial(int n, int k)  
{ 
  // Base Cases 
  if (k == 0 || k == n) 
      return 1; 
    
  // Recur 
  return binomial(n - 1, k - 1) + binomial(n - 1, k); 
} 
