int scl = 1;

float zoff = 0;
int num = 10000;
ArrayList<Particle> particles = new ArrayList<Particle>(num);
//Particle 
PImage img;

  
void setup() {
  colorMode(HSB,255,255,255);
  size(1920,1080);
  background(0);
  
  img = loadImage("img_input/PS1_v1.png");
  loadPixels();
  img.loadPixels();
  
//  for(Particle p : particles){
//    p = new Particle(random(width),random(height));
//}
  for (int i = 0; i <= num; i++){
    particles.add(new Particle(random(0,width),random(0,height)));
    //particles.add(new Particle((random(width/2,1.2*width)),random(-height/5,height*0.80)));
  }
}

void draw() {
  noStroke();
  //
  int cols = floor(width/scl);
  int rows = floor(height/scl);
  int speed = 6;
//perlin field
  //float yoff = 0;
  //for (int y = 0; y < rows; y++) {
  //  float xoff = 0;
  //  for (int x = 0; x < cols; x++) {

  //    int index = (x + (y*width))*4;
  //    float angle = noise(xoff, yoff, zoff) * TWO_PI;


  //    //push();
  //    //translate(x*scl,y*scl);

  //    rect(x*scl, y*scl, scl, scl);
  //    fill(noise(xoff, yoff, zoff) * 255);
  //    //pop();

  //    xoff += 0.01;
  //  }
  //  yoff += 0.01;
  //}
  //zoff += 0.00;
  
  for(Particle p : particles){
    //p.update();
    if (frameCount > 1) {
      p.update();
      p.display();
    } else {
      p.oneTime();
      p.display();
    }
    //p.oneTime();
    //p.update();
    //p.display();
    
  }
  
  
  // save image
  
  if (mousePressed && (mouseButton == LEFT)){
    saveFrame("img_output/img####.png");
    println("done saving");
  } else {
    
  }
  
  
}
