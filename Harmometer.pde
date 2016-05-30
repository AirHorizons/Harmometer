boolean keys[] = new boolean[13];
IntList difflist;
int freqlist[] = {2,31,17,11,9,7,77,5,13,8,25,23,3};
int max=0;

void setup(){
  size(1000, 1000);
  noStroke();
  int len = freqlist.length;
  for (int i=0;i<freqlist.length;i++){
    max += freqlist[i]*len;
    len -= 1;
  }   
  max /= freqlist.length;
}

void draw() {
  background((max-setColor())*(255)/max);
}

void keyPressed(){
  if (key == 'w')  keys[0] = true;
  if (key == 'a')  keys[1] = true;
  if (key == 's')  keys[2] = true;
  if (key == 'd')  keys[3] = true;
  if (key == 'f')  keys[4] = true;
  if (key == 'g')  keys[5] = true;
  if (keyCode == UP)  keys[6] = true;
  if (keyCode == DOWN)  keys[7] = true;
  if (keyCode == LEFT)  keys[8] = true;
  if (keyCode == RIGHT)  keys[9] = true;
  if (key == ' ')  keys[10] = true;
}

void mousePressed(){
  if (mouseButton == LEFT) keys[11] = true;
  if (mouseButton == RIGHT) keys[12] = true;
}

void keyReleased(){
    if (key == 'w')  keys[0] = false;
  if (key == 'a')  keys[1] = false;
  if (key == 's')  keys[2] = false;
  if (key == 'd')  keys[3] = false;
  if (key == 'f')  keys[4] = false;
  if (key == 'g')  keys[5] = false;
  if (keyCode == UP)  keys[6] = false;
  if (keyCode == DOWN)  keys[7] = false;
  if (keyCode == LEFT)  keys[8] = false;
  if (keyCode == RIGHT)  keys[9] = false;
  if (key == ' ')  keys[10] = false;
}

void mouseReleased(){
  if (mouseButton == LEFT) keys[11] = false;
  if (mouseButton == RIGHT) keys[12] = false;
}

int setColor(){
  difflist = new IntList();
  int harmony=0;
  int len;
  int min = findRoot();
  if (min == 13) return 0;
  else 
  {
    for (int i=min;i<12;i++)
    {
      if (keys[i] == true)
        difflist.append(i-min);
    }
    len = difflist.size();
    while (difflist.size() != 0)
    {
      for (int i=0;i<difflist.size();i++)
      {
        harmony += freqlist[difflist.get(i)];
      }
      difflist.remove(0);
      for (int i=0;i<difflist.size();i++)
      {
        difflist.set(i, difflist.get(i)-difflist.get(0));
      }
    }
    return harmony/len;
  }
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