float[][] data;
PImage src; 
PShape shape;

void setup() {
  src = loadImage("http://farm4.staticflickr.com/3048/2806099034_30bba78310_o.jpg");
  src.resize(300*30, 300*20);
  size(src.width, src.height);
  data = new float[src.width][src.height];
  smooth();
  genNoise(data);
  background(0);
}

void genNoise(float[][] data) {
  float noiseScale=0.00075;
  noiseDetail(1, 0.5);
  for (int i = 0; i < data.length; i++) {
    for (int j = 0; j < data[i].length; j++) {
      data[i][j] = noise(j * noiseScale, i * noiseScale);
    }
  }
}

void draw() {
  for (int i = 0; i < 2000; i++) {
    int nX = (int) random(width);
    int nY = (int) random(height);
    float d = data[nX][nY];
    pushMatrix();
    int c = src.get(nX, nY);
    float a = map(nY, 0, height, 255, 100);
    fill(c);
    stroke(0);
    strokeWeight(0.25);
    translate(nX, nY);
    rotate(map(d, 0, 1, -PI, PI));
    float newLength = map(nY, 0, height, 100, 750);
    float newWidth = map(nY, 0, height, 10, 75);
    rectMode(CENTER);
    rect(0, 0, newLength, newWidth);
    popMatrix();
  }
}

void keyPressed() {
  if (key == 's') {
    saveFrame();
    exit();
  }
}

