class Tri {
  int alpha;
  int r,g,b;
  int x1,y1,x2,y2,x3,y3;
  
  int fitness;
  int stable;
  
  Tri() {
    alpha = int(random(16));
    r = int(random(256));
    g = int(random(256));
    b = int(random(256));
    x1 = int(random(width));
    y1 = int(random(height));
    x2 = int(random(width));
    y2 = int(random(height));
    x3 = int(random(width));
    y3 = int(random(height));
    stable = 0;
  }
  
  void mutate() {
    //println("mutating");
    alpha = blurNum(alpha, true);
    alpha = min(alpha,32);
    //println("mutating2");
    r = blurNum(r, true);
    g = blurNum(g, true);
    b = blurNum(b, true);
    x1 = blurNum(x1);
    //println("mutating3");
    y1 = blurNum(y1);
    x2 = blurNum(x2);
    y2 = blurNum(y2);
    x3 = blurNum(x3);
    y3 = blurNum(y3);
    //println("mutated");
  }
  
  void draws() {
    fill(r,g,b,alpha);
    //triangle(x1,y1,x2,y2,x3,y3);
    ellipse(x1,y1,x2,y2);
    //rect(x1,y1,x2,y2);
  }
  
  int[] saved = new int[12];
  
  void store() {
    saved[0] = alpha;
    saved[1] = r;
    saved[2] = g;
    saved[3] = b;
    saved[4] = x1;
    saved[5] = y1;
    saved[6] = x2;
    saved[7] = y2;
    saved[8] = x3;
    saved[9] = y3;
    saved[10] = fitness;
    saved[11] = stable;
  }
    
  void recall() {
    alpha = saved[0];
    r = saved[1];
    g = saved[2];
    b = saved[3];
    x1 = saved[4];
    y1 = saved[5];
    x2 = saved[6];
    y2 = saved[7];
    x3 = saved[8];
    y3 = saved[9];
    fitness = saved[10];
    stable = saved[11];
  }
  
  void printTri() {
    print(alpha + ",");
    print(r + ",");
    print(g + ",");
    print(b + ",");
    print(x1 + ",");
    print(y1 + ",");
    print(x2 + ",");
    print(y2 + ",");
    print(x3 + ",");
    print(y3 + ",");
    print(fitness + ",");
    println(stable);
  }
}

int blurNum(int n) {
  float b = float(n);
  //int out = int(random(b - width * mutateFactor, b + width * mutateFactor));
  int out = int(b + random(-1 * width * mutateFactor, width * mutateFactor + 1));
  out = constrain(out, -1 * width, width * 2);
  //println(n + "\t" + out);
  return out;
}

int blurNum(int n,boolean max) {
  float b = float(n);
  //int out = int(random(b - 256 * mutateFactor, b + 256 * mutateFactor));
  int out = int(b + random(-256 * mutateFactor, 256 * mutateFactor + 1));
  if (max) {
    out = constrain(out,0,255);
  }

  return out;
}
