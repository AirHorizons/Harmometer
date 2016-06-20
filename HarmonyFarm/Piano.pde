import ddf.minim.*;

class Piano {
    Minim minim;
    AudioPlayer song;
     String[] filenames = 
     {
       "c3.wav","d3.wav","e3.wav","f3.wav","g3.wav","a3.wav",
       "b3.wav"
     };
       
       boolean playing[] = new boolean[24];
       
       //Constructor
       Piano() {
         minim = new Minim(HarmonyFarm.this);
         for(int i=0;i<playing.length;i++)
           playing[i] = false;
       }
       
       void play(boolean[] keys){
         for(int i=0;i<keys.length;i++)
         {
           if (keys[i] == true)
           {
               song = minim.loadFile(dataPath(filenames[i]));
               song.play();
           }
         }
       }
}