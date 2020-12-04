//based on this site https://stackoverflow.com/questions/7348009/y-coordinate-for-a-given-x-cubic-bezier/17546429#17546429?newreg=c073a9f1dd674d6282ff446b99046204
float CubicBezier(float a, float b, float c, float d, float t){
  return (1 - t)*QuadraticBezier(a, b, c, t) + t*QuadraticBezier(b, c, d, t);
}

float solveCubicBezier(float a, float b, float c, float d, float x){
  //we could do something less stupid, but since the x is monotonic
  //increasing given the problem constraints, we'll do a binary search.

  //establish bounds
  float lower = 0;
  float upper = 1;
  float percent = (upper + lower) / 2;

  //get initial x
  float xc = CubicBezier(a, b, c, d, percent);

  //loop until completion
  while(abs(x - xc) > xTolerance) {
    if(x > xc) 
      lower = percent;
    else 
      upper = percent;

    percent = (upper + lower) / 2;
    xc = CubicBezier(a, b, c, d, percent);
  }
  //we're within tolerance of the desired x value.
  //return the y value.
  return percent;
}



/*PVector solveQuadraticEquation(float a, float b, float c) {//failed

    float discriminant = b * b - 4 * a * c;

    if (discriminant < 0) {
        return null;

    } else {
        return new PVector(
            (-b + sqrt(discriminant)) / (2 * a),
            (-b - sqrt(discriminant)) / (2 * a)
        );
    }

}

PVector solveCubicEquation(float a, float b, float c, float d) {

    //if (!a) return solveQuadraticEquation(b, c, d);

    b /= a;
    c /= a;
    d /= a;

    float p = (3 * c - b * b) / 3;
    float q = (2 * b * b * b - 9 * b * c + 27 * d) / 27;

    if (p == 0) {
        return new PVector(pow(-q, 1 / 3), 0);

    } else if (q == 0) {
        return new PVector(sqrt(-p), -sqrt(-p));

    } else {

        float discriminant = pow(q / 2, 2) + pow(p / 3, 3);

        if (discriminant == 0) {
            return new PVector(pow(q / 2, 1 / 3) - b / 3, 0);

        } else if (discriminant > 0) {
            return new PVector(pow(-(q / 2) + sqrt(discriminant), 1 / 3) - pow((q / 2) + sqrt(discriminant), 1 / 3) - b / 3, 0, 0);

        } else {

            float r = sqrt( pow(-(p/3), 3) );
            float phi = acos(-(q / (2 * sqrt(pow(-(p / 3), 3)))));

            float s = 2 * pow(r, 1/3);

            return new PVector(
                s * cos(phi / 3) - b / 3,
                s * cos((phi + 2 * PI) / 3) - b / 3,
                s * cos((phi + 4 * PI) / 3) - b / 3
            );

        }

    }
}

float roundToDecimal(float num, float dec) {
    return round(num * pow(10, dec)) / pow(10, dec);
}

PVector solveCubicBezier(float p0, float p1, float p2, float p3, float x) {

    p0 -= x;
    p1 -= x;
    p2 -= x;
    p3 -= x;

    float a = p3 - 3 * p2 + 3 * p1 - p0;
    float b = 3 * p2 - 6 * p1 + 3 * p0;
    float c = 3 * p1 - 3 * p0;
    float d = p0;

    PVector roots = solveCubicEquation(
        p3 - 3 * p2 + 3 * p1 - p0,
        3 * p2 - 6 * p1 + 3 * p0,
        3 * p1 - 3 * p0,
        p0
    );

    PVector result = new PVector();
    float root;
    root = roundToDecimal(roots.x, 15);
    if (root >= 0 && root <= 1) result.x = root;
    root = roundToDecimal(roots.y, 15);
    if (root >= 0 && root <= 1) result.y = root;
    root = roundToDecimal(roots.z, 15);
    if (root >= 0 && root <= 1) result.z = root;
    return roots;

}*/
