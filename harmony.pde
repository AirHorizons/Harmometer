boolean keys[] = new boolean[13];
IntList difflist;
int freqlist[] = {2,31,17,11,9,7,77,5,13,8,25,23,3};

void setup(){
  size(500, 500);
  noStroke();
}

void draw() {
  background(232-setColor());
}

void keyPressed(){
  if (key == 'a')  keys[0] = true;
  if (key == 'w')  keys[1] = true;
  if (key == 's')  keys[2] = true;
  if (key == 'e')  keys[3] = true;
  if (key == 'd')  keys[4] = true;
  if (key == 'f')  keys[5] = true;
  if (key == 't')  keys[6] = true;
  if (key == 'g')  keys[7] = true;
  if (key == 'y')  keys[8] = true;
  if (key == 'h')  keys[9] = true;
  if (key == 'u')  keys[10] = true;
  if (key == 'j')  keys[11] = true;
  if (key == 'k')  keys[12] = true;
  
  
}

void keyReleased(){
    if (key == 'a')  keys[0] = false;
  if (key == 'w')  keys[1] = false;
  if (key == 's')  keys[2] = false;
  if (key == 'e')  keys[3] = false;
  if (key == 'd')  keys[4] = false;
  if (key == 'f')  keys[5] = false;
  if (key == 't')  keys[6] = false;
  if (key == 'g')  keys[7] = false;
  if (key == 'y')  keys[8] = false;
  if (key == 'h')  keys[9] = false;
  if (key == 'u')  keys[10] = false;
  if (key == 'j')  keys[11] = false;
  if (key == 'k')  keys[12] = false;
}

int setColor(){
  difflist = new IntList();
  int harmony=0;
  int min = findRoot();
  if (min == 13) return 0;
  else 
  {
    for (int i=min;i<12;i++)
    {
      if (keys[i] == true)
        difflist.append(i-min);
    }
    for (int i=0;i<difflist.size();i++)
    {
      harmony += freqlist[difflist.get(i)];
    }
    return harmony;
  }
}

int setColorR(IntList il){

}

int findRoot(){
  int i;
  for (i=0;i<12;i++)
  {
    if (keys[i] == true)
      return i;
  }
  return 13;
}