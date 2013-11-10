long compare() { //PImage m, PImage n) {
  //blend(target,0,0,width,height,0,0,width,height,DIFFERENCE);
  long diff = 0;
  loadPixels();
  String name = "TriE";
  
  //save some images
  if (iterations % divisor == 0) {
    save("TriE" + divisor + ".png");
    divisor *= 2;
    println("Iteration " + iterations);
    for (int ii = 0; ii < numElements; ii++) {
      tris[ii].printTri();
    }
  }
  
  
  //PImage diffImg = createImage(width,height,RGB);
  
  for (int i = 0; i < width * height; i++) {
    diff += abs(pixels[i] - target.pixels[i]);
    //diff += abs(pixels[i].saturation() - target.pixels[i].saturation());
    //diff += abs(pixels[i].brightness() - target.pixels[i].brightness());
    //pixels[i] = abs(pixels[i] - target.pixels[i]);
  }
  //updatePixels();
  return diff/1000000;
}

void delay(int t) {
  int time = millis() + t;
  while (millis() < time) {
  }
}
