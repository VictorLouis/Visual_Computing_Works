int illusions = 6;
int current = 1;
//toggle illusion activation
boolean active = true;
float x;
int k=360;
int c;

void setup() {
  size(800, 800);
}

void draw() {
  background(255);
  pushStyle();
  switch(current) {
  case 1:
    colors();
    break;
    // implement from here. Don't forget to add break for each case
  case 2:
    graydot();
    break;
  case 3:
    hering();
    break;
  case 4:
    steps();
    break;
  case 5:
    hipnotize();
    break;
  case 6:
    squares();
    break;
  }
  popStyle();
}

// switch illusion using the spacebar
void keyPressed() {
  if (key == ' ')
    current = current < illusions ? current+1 : 1;
  if (key == 'a')
    active = !active;
}

// Complete info for each illusion
 
/*
 illusion abstract
 Author: 
 Code adapted from Rami Madani implementation
 Tags: Physiological illusion, Hermann grid illusion
*/
void colors(){
  //black background
  background(0);
  colorMode(HSB);
  //centered
  translate(400,400);
  //t => {1, 512}
  for (int t=0, C=0; t<k; t++, C++){
    //all collours
    if (2*c + C > 256){
    C-=256;
    }
    else if (2*c + C < 0){
      C+=256;
    }
    fill(C + 2*c,255,255);
    //the golden ratio angle (the magic)
    rotate(radians(137.5));
    //change of size with respect to distance to center
      ellipse(t-k,0,2*sqrt(abs(t-k)),2*sqrt(abs(t-k)));
  }
  //black circles
  if(active){
    noFill();
    strokeWeight(7);
    stroke(0);
    for(int n = 0; n < 60; n++){
      
      if(-c + 18*n > 0){
        ellipse(0, 0, -c + 18*n, -c + 18*n);
      }
      if(c > 256){
        c-=256;
      }
    }
    noStroke();
    c+=2;
  }
}

/*
 Gradient Illusion
 Code implemented by Victor Luis Angulo ovar
 Tags: Physiological illusion, Hermann grid illusion
*/
void graydot(){
  background(255);          // black background

  //style
  noStroke();
  if(active){
  fill(60);    
  rect(100, height/2, 100, 100);
  fill(100);    
  rect(200, height/2, 100, 100);
  fill(140);    
  rect(300, height/2, 100, 100);
  fill(180);   
  rect(400, height/2, 100, 100);
  fill(220);   
  rect(500, height/2, 100, 100);
  
  fill(130);
  ellipse(150, 450, 55, 55);
  ellipse(250, 450, 55, 55);
  ellipse(350, 450, 55, 55);
  ellipse(450, 450, 55, 55);
  ellipse(550, 450, 55, 55);
  }
  else {
    background(255);
    fill(130);
  ellipse(150, 450, 55, 55);
  ellipse(250, 450, 55, 55);
  ellipse(350, 450, 55, 55);
  ellipse(450, 450, 55, 55);
  ellipse(550, 450, 55, 55);
  }

}

/*
 Hering Illusion
 Author: E. Lingelbach, 1994
 Code adapted from Greg Wittman implementation
*/
void hering(){
  if(active){
    background(255);
    translate(400, 400);
    stroke(0, 0, 100);
    for (int i=0; i<490; i=i+10) {
      rotate(5);
      line(0, 0, 400, 400);
    }
    strokeWeight(3);
    stroke(200, 0, 0);
    rotate(-245);
    translate(-250, -250);
    line(200, 0, 200, 500);
    line(300, 0, 300, 500);
  }
  else{
    translate(400, 400);
    stroke(0, 0, 100);
    for (int i=0; i<490; i=i+10) {
      rotate(5);
      
    }
    strokeWeight(3);
    stroke(200, 0, 0);
    rotate(-245);
    translate(-250, -250);
    line(200, 0, 200, 500);
    line(300, 0, 300, 500);
  }
}

/*
 Stepping Feet
 Author: E. Lingelbach, 1994
 Code adapted from xyz implementation
 Tags: Physiological illusion, Hermann grid illusion
*/
void steps(){
  background(255);

  for (int i = 0; i < 30;i++) {
    noStroke();
    fill(0);
    rect(i * 20, 0, 10, height);
  }

  if (mousePressed == true) {
    background(150);
  }

  for (int q = 0; q < 4; q++) {
    if (q % 2 == 0) {
      fill(0);
    }
    else {
      fill(255);
    }
    rect(x, q * 90 + 5, 20, 50);
  }

  if (!active) {
    stroke(255, 0, 0);
    strokeWeight(3);
    noFill();
    rect(x, 5, 21, 320);
  }
  
  x += 0.5;
 
  if (x > width + 10) {
    x = 0;
  }
  
}

/*
 Hipnotize
 Code adapted from Jesse Smith implementation
 Tags: Physiological illusion, Hermann grid illusion
*/
void hipnotize(){
  background(0);
  noStroke();
  smooth();
  
  int layers = 80;
  
  for(int i=layers; i>0; i--)
  {
    if(i%2 == 0)
      fill(255);
    else
      fill(0);
      
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(0.1 * frameCount*(layers+1-i)));
    
    float delta = 10;
    polygon(3, 0, 0, i*delta);
    
    popMatrix();
  }
}


/*
 Moving Polygons
 Author: Bridget Louise Rile, 1961
 Code adapted from RHeartbreak implementation
 Tags: Physiological illusion, Art
*/
void polygon(int sides, float x, float y, float rad)
{
  beginShape();
  PVector orig = new PVector(x, y);
  for(int i=0; i<sides; i++)
  {
    float angle = i*360.0 / sides;
    PVector newPt = new PVector(orig.x + rad*sin(radians(angle)), orig.y + rad*cos(radians(angle)));
    vertex(newPt.x, newPt.y);
  }
  endShape();
}

/*
 Moving Squares
 Author: Bridget Louise Rile, 1961
 Code adapted from RHeartbreak implementation
 Tags: Physiological illusion, Art
*/
void squares(){
 background(0);
  smooth();
  float angle = 0.0;
  //float scaleVal = 60.0/1.5;
  float scaleVal = (mouseX/7.6)/1.5;
  float i = 4;
  println(i);
  float angleInc = PI/i;
  float w = 75/1.5;
  fill(255);
  for (int y=0; y<= height+w; y+=w){
    stroke(130);
    strokeWeight(2);
    line(0,y,800,y);
  }
  
  for (int offset = 0; offset<width+w; offset +=w*2){
    angle = 0.0;
    //noStroke();
    for (int y=0; y<= height; y+=w){
      float x = offset + (sin(angle)*scaleVal);
      rect(x,y,w,w);
      angle += angleInc;
    }
  }
}