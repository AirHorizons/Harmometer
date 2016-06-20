import ddf.minim.*;
import processing.serial.*;

boolean keys[] = new boolean[7];
boolean c, dm, em, f, g, am;
int mappedkeys[] = new int[13];
String notes[] = {"Do", "Re", "Mi", "Fa", "Sol", "La", "Ti"};
int milli = 1000;

String flowerimages[] = {"flower1.png","flower2.png","flower3.png","flower4.png","flower5.png","flower6.png","flower7.png","flower8.png"};

Piano piano;
PImage ground;
PImage flower;
PFont Bold;

void setup(){
  size(640,480);
  background(116,190,22);
  fill(230);
  Bold = createFont("Arial Bold", 18);
    

  for (int i=0;i<mappedkeys.length;i++) {
    mappedkeys[i] = 0;
  }
  
  ground = loadImage("ground.png");

  
  piano = new Piano();
  
}

void draw(){
  background(116,190,22);
  image(ground,0,0);
  textFont(Bold);
  piano.play(keys);
  mapkeys();
  int n = flowernum();
  int cnt = 1;
  for (int i=0;i<mappedkeys.length;i++){
    if (mappedkeys[i] != 0)
    {
      flower = loadImage(flowerimages[mappedkeys[i]]);
      textSize(40);
      text(notes[i], (cnt*640/(n+1))-30,150);
      image(flower,(cnt*640/(n+1))-75,150);
      cnt += 1;
    }
  }
  delay(milli);
}

void mapkeys(){
  // map chord
  c = (keys[0] && !keys[1] && keys[2] && !keys[3] && keys[4] && !keys[5] && !keys[6]);
  dm = (!keys[0] && keys[1] && !keys[2] && keys[3] && !keys[4] && keys[5] && !keys[6]); // 1 3 5
  em = (!keys[0] && !keys[1] && keys[2] && !keys[3] && keys[4] && !keys[5] && keys[6]); // 2 4 6
  f = (keys[0] && !keys[1] && !keys[2] && keys[3] && !keys[4] && keys[5] && !keys[6]); // 0 3 5
  g = (!keys[0] && keys[1] && !keys[2] && !keys[3] && keys[4] && !keys[5] && keys[6]);  // 1 4 6
  am = (keys[0] && !keys[1] && keys[2] && !keys[3] && !keys[4] && keys[5] && !keys[6]);  // 0 2 5
  
  mappedkeys[0] = (keys[0]) ? 1 : 0;
  mappedkeys[1] = (keys[1]) ? 1 : 0;
  mappedkeys[2] = (keys[2]) ? 1 : 0;
  mappedkeys[3] = (keys[3]) ? 1 : 0;
  mappedkeys[4] = (keys[4]) ? 1 : 0;
  mappedkeys[5] = (keys[5]) ? 1 : 0;
  mappedkeys[6] = (keys[6]) ? 1 : 0;
  
  if (c) {
    mappedkeys[0] = bloom('c',mappedkeys[0]);
    mappedkeys[2] = bloom('c',mappedkeys[2]);
    mappedkeys[4] = bloom('c',mappedkeys[4]);
    textSize(80);
    text("C", 300, 70);
  }
  if (dm) {
    mappedkeys[1] = bloom('d',mappedkeys[1]);
    mappedkeys[3] = bloom('d',mappedkeys[3]);
    mappedkeys[5] = bloom('d',mappedkeys[5]);
    textSize(80);
    text("Dm", 300, 70);
  }
  if (em) {
    mappedkeys[2] = bloom('e',mappedkeys[2]);
    mappedkeys[4] = bloom('e',mappedkeys[4]);
    mappedkeys[6] = bloom('e',mappedkeys[6]);
    textSize(80);
    text("Em", 300, 70);
  }
  if (f) {
    mappedkeys[0] = bloom('f',mappedkeys[0]);
    mappedkeys[3] = bloom('f',mappedkeys[3]);
    mappedkeys[5] = bloom('f',mappedkeys[5]);
    textSize(80);
    text("F", 300, 70);
  }
  if (g) {
    mappedkeys[1] = bloom('g',mappedkeys[1]);
    mappedkeys[4] = bloom('g',mappedkeys[4]);
    mappedkeys[6] = bloom('g',mappedkeys[6]);
    textSize(80);
    text("G", 300, 70);
  }
  if (am) {
    mappedkeys[0] = bloom('a',mappedkeys[0]);
    mappedkeys[2] = bloom('a',mappedkeys[2]);
    mappedkeys[5] = bloom('a',mappedkeys[5]);
    textSize(80);
    text("Am", 300, 70);
  }
}

int bloom(char type, int n){
  if (n != 0) 
  {
    switch (type) {
      case 'c':
        return 2; 
      case 'd':
        return 3; 
      case 'e':
        return 4; 
      case 'f':
        return 5; 
      case 'g':
        return 6; 
      case 'a':
        return 7; 
      default:
        return 0;
    }
  }
  else return 0;
}

int flowernum(){
  int n=0;
  for (int i=0;i<mappedkeys.length;i++)
  {
    if (mappedkeys[i] != 0) n++;
  }
  return n;
}

void keyPressed(){
  // keyboard keys are optimized for makey-makey
  if (key == '1')  keys[0] = true; 
  if (key == '2')  keys[1] = true; 
  if (key == '3')  keys[2] = true; 
  if (key == '4')  keys[3] = true; 
  if (key == 'b')  keys[4] = true; 
  if (key == 'j')  keys[5] = true; 
  if (key == 'o')  keys[6] = true;
  if (key == '+') {
    if (!(milli <= 500)) {
      if (milli >= 1000) milli-=6;
      else milli-=3;
    }
  }
  if (key == '-') {
    if (!(milli >= 2000)) {
      if (milli <= 1000) milli+=3;
      else milli+=6;
    }
   }
  if (keyCode == ENTER) exit();
}


void keyReleased(){
  if (key == '1')  keys[0] = false;
  if (key == '2')  keys[1] = false;
  if (key == '3')  keys[2] = false;
  if (key == '4')  keys[3] = false; 
  if (key == 'b')  keys[4] = false;
  if (key == 'j')  keys[5] = false;
  if (key == 'o')  keys[6] = false;
}