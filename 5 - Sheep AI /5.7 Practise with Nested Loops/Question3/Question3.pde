int numberX; 
int numberY; 
int spaceing;

PFont numberFont; 

void setup() 
{
    size(512, 512);
    numberX = 1;
    numberY = 1;
    spaceing = width/11;
    numberFont = loadFont("Serif-48.vlw");
}

void draw() 
{
   while (numberX <= 10)
   {
       numberY = 0;
       while (numberY <= 10)
       {   
           if ( (numberY == 1 && numberX == 1))
           {
               // do nothing
           }
            else if (numberY == 1)
            {
                text((numberX -1)+ "x" + numberY, (numberX) *  spaceing, (numberY ) *  spaceing);
            }
            else if (numberX == 1)
            {
                text((numberX)+ "x" + (numberY-1), (numberX) *  spaceing, (numberY ) *  spaceing);
            }
           else 
           {
            text((numberX -1) * (numberY-1), (numberX) *  spaceing, (numberY) *  spaceing);
           }
            numberY++;
       }
        numberX++;
   }
}
