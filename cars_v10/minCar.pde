class MinCar {

  float hp;
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  float maxspeed;
  float fuel;


  MinCar(color tempC, float tempXpos, float tempYpos, float tempXspeed, float tempYspeed) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
    yspeed = tempYspeed;
    maxspeed = 4;
    fuel = 100;
    hp = 5;
}

  void render() {

    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos, ypos, 20, 10);

    text(fuel, 50, 50);
  }

  void update() {

    // keep speed under maxspeed
    if (xspeed > maxspeed) {
      xspeed = maxspeed;
    }
    if (xspeed < (-1) * maxspeed) {
      xspeed = (-1) * maxspeed;
    }
    if (yspeed > maxspeed) {
      yspeed = maxspeed;
    }
    if (yspeed < (-1) * maxspeed) {
      yspeed = (-1) * maxspeed;
    }

    // Check for borders
    if (xpos > width) {
      xpos = width;
    }
    if (xpos < 0) {
      xpos = 0;
    }
    if (ypos < 0) {
      ypos = 0;
    }
    if (ypos > height) {
      ypos = height;
    }

    // update position
    if (fuel > 0) {
      xpos = xpos + xspeed;
      ypos = ypos + yspeed;

      // fuel consumtion
      fuel = fuel - sqrt(sq(xspeed)+sq(yspeed))*0.05;
    }

    collisionCheck();

  if(hp < -1 ){
    rect(100,100,1000,1000);
  }
}


  void explode() {
    image(explosion_image, xpos, ypos);
  }


  void collisionCheck() {
    
    for (int i = 0; i < Cars.length; i++) {
     
      if (abs(Cars[i].xpos - xpos) < 20 && abs(Cars[i].ypos - ypos) < 20) {
        explode();
        hp = - 1;
      }
    }
    
    if (abs(Fuel1.xpos - xpos) < 60 && abs(Fuel1.ypos - ypos) < 60) {
      fuel = + 60;
    }
}
}
