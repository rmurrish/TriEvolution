PImage target;

float mutateFactor = 0.01;

int numElements = 500;
Tri[] tris;
Tri[] tris_old;
long compare_old = 2147483640;
long compare_new = 0;
int iterations = 0;
int improvements = 0;
float ratio = 1.0;
int divisor = 1;

void setup() {
  target = loadImage("test.jpg");
  
  size(target.width, target.height);
  noStroke(); //comment out to see outlines
  tris = new Tri[numElements];
  tris_old = new Tri[numElements];
  
  
  //println("Hello");
  for (int ii = 0; ii < numElements; ii++) {
    tris[ii] = new Tri();
    //println(ii);
  }  
}

void draw() {
  //println("In loop... ");
  iterations++;
  background(0);
  //arrayCopy(tris,tris_old);
  
  for (int ii = 0; ii < numElements; ii++) {
    tris[ii].store();
    tris[ii].mutate();
    tris[ii].draws();
  }
  
  compare_old = compare_new;
  compare_new = compare();
  ratio = float(improvements)/float(iterations);
  
  if (compare_new < compare_old) {
    improvements++;
    println("Diff: " + compare_new + "\tIterations: " + iterations +"\tImprovements: " + improvements + "\tRatio: " + ratio);
  }
  else {
    for (int ii = 0; ii < numElements; ii++) {
      tris[ii].recall();
      //compare_new = compare_old;
    }
  }


  
  /*
  //compare_old = compare_new;
  compare_new = compare();
  ratio = float(improvements)/float(iterations);
  
  if(compare_new < compare_old) {
    println("Diff: " + compare_old + "\tIterations: " + iterations +"\tImprovements: " + improvements + "\tRatio: " + ratio);
    improvements++;
    compare_old = compare_new;
  }
 
  else { 
    //println("else");
    for (int ii = 0; ii < numElements; ii++) { 
      tris[ii] = tris_old[ii];
    }
    compare_new = compare_old;
  }
  
  //delay(1000);
  */
}
