class Particle {
  PVector position;
  PVector velocity;
  PVector accel;
  //float magfac = 0.005;
  //float noisefac = noise(position.x * magfac, position.y * magfac);
  float noisefac;
  float noisefac1;
  //img = loadImage("img_input/skullHQQr.png");

  // img import


  Particle(float X, float Y) {
    position = new PVector(X, Y);
    velocity = new PVector(0, 0);
    accel = new PVector(0, 0);
    //loadPixels();
    //img.loadPixels();
  }
  
  void oneTime() {
    img.loadPixels();

    float magfac = 0.008;
    float accfac = 1;
    noisefac = noise(position.x * magfac, position.y * magfac, frameCount*0.00);
    
    float anglefac1 = position.heading() + (1 * map(noisefac,0,1,-PI,PI));
    float angle1 = anglefac1;
    //float angle = anglefac;
    //float angle = position.heading() + anglefac;
    //float angle1 = radians(step(degrees(anglefac1)));
    velocity = PVector.fromAngle(angle1);
    velocity.setMag(1);
    
    position.add(velocity);
    //println(position.heading());
    //display();
  }

  void update() {
    img.loadPixels();

    float magfac = 0.008;
    float accfac = 1;
    noisefac = noise(position.x * magfac, position.y * magfac, frameCount*0.00);
    //int loc  = (ceil(position.x)-1)+ ((ceil(position.y)-1) *width) ;
    //edges();
    //noisefac = 1 * brightness(img.pixels[loc]);
    float anglefac = position.heading() + (1 * map(noisefac,0,1,-PI,PI));
    //float angle = 0.6 * map(noisefac, 0, 255, 0, TWO_PI);
    float angle = anglefac;
    //float angle = position.heading() + anglefac;
    //float angle = radians(step(degrees(anglefac)));
    // hard coding 45 degrees
    //if(anglefac < PI/4){
    //  angle = 0;
    //} else if (anglefac > 1*(PI/4) && anglefac < 2*(PI/4) ){
    //  angle = 1*(PI/4);
    //} else if (anglefac > 2*(PI/4) && anglefac < 3*(PI/4) ){
    //  angle = 2*(PI/4);
    //} else if (anglefac > 3*(PI/4) && anglefac < 4*(PI/4) ){
    //  angle = 3*(PI/4);
    //} else if (anglefac > 4*(PI/4) && anglefac < 5*(PI/4) ){
    //  angle = 4*(PI/4);
    //} else if (anglefac > 5*(PI/4) && anglefac < 6*(PI/4) ){
    //  angle = 5*(PI/4);
    //} else if (anglefac > 6*(PI/4) && anglefac < 7*(PI/4) ){
    //  angle = 6*(PI/4);
    //} else if (anglefac > 7*(PI/4) && anglefac < 8*(PI/4) ){
    //  angle = 7*(PI/4);
    //} else if (anglefac > 8*(PI/4) && anglefac < 9*(PI/4) ){
    //  angle = 8*(PI/4);
    //}
    
    //velocity = PVector.fromAngle(angle);
    //velocity.setMag(1);
    //position.add(PVector.div(velocity, frameCount));
    //position.add(velocity);
    //println(noisefac);
    //display();

    // for accel
    accel = PVector.fromAngle(angle);
    accel.setMag(noisefac * accfac);
    velocity.add(accel);
    velocity.limit(1);
    //position.add(PVector.div(velocity, frameCount));
    position.add(velocity);
    //println(position.heading());
    //display();
  }

  void display() {
    update();
    PVector ref = PVector.fromAngle(0);
    ref.setMag(1);
    //float angle = PVector.angleBetween(position, accel);
    //float colfac = map(angle, 0, PI, 150, 220);
    float colfac = map(noisefac,0,1,120,190);
    float size = map(noisefac,0,1,0,3);
    float a = 0.009;
    float b = 100;
    float c = 255;
    float d = 0.94;
    float visifac = (-b*(exp(-(a*(frameCount))+d)))+c;
    noStroke();
    fill(colfac, 150, visifac);
    circle(position.x, position.y, size);


    //println(degrees(angle));
  }

  void edges() {
    float magfac = 0.008;

    int loc  = (ceil(position.x)-1)+ ((ceil(position.y)-1) *width) ;
    if (position.x < 0 | position.x > width | position.y < 0 | position.y > height) {
      noisefac = noise(position.x * magfac, position.y * magfac, frameCount*0.00);
    } else {
      if (brightness(img.pixels[loc]) > 1) {
        noisefac = 1 * brightness(img.pixels[loc]);
      } else {
        noisefac = noise(position.x * magfac, position.y * magfac, frameCount*0.00);
      }
    }
  }
  
  float step(float fac){
    float ang = 45;
    
    float step = (fac - (fac%ang))/ang;
    
    float angle = ang * step;
    return angle;
  }
}
