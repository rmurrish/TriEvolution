float mutateFactor = 0.01;

int numElements = 50;
Tri[] tris;

void setup() {
  size(640, 480);
  noStroke(); //comment out to see outlines
  tris = new Tri[numElements];
  
  //println("Hello");
  for (int ii = 0; ii < numElements; ii++) {
    tris[ii] = new Tri();
    //println(ii);
  }
}

void draw() {
  //println("In loop... ");
  background(0);
  for (int ii = 0; ii < numElements; ii++) {
    //println("counting");
    tris[ii].mutate();
    tris[ii].draws();
  }
}
class Tri {
  int alpha;
  int r,g,b;
  int x1,y1,x2,y2,x3,y3;
  
  int fitness;
  int stable;
  
  Tri() {
    alpha = int(random(256));
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
    triangle(x1,y1,x2,y2,x3,y3);
    //ellipse(x1,y1,x2,y2);
    //rect(x1,y1,x2,y2);
  }
}

int blurNum(int n) {
  float b = float(n);
  int out = int(random(b - width * mutateFactor, b + width * mutateFactor));
  out = constrain(out,-1*width,width*2);
  //println(n + "\t" + out);
  return out;
}

int blurNum(int n,boolean max) {
  float b = float(n);
  int out = int(random(b - 256 * mutateFactor, b + 256 * mutateFactor));
  if (max) {
    out = constrain(out,0,255);
  }

  return out;
}

