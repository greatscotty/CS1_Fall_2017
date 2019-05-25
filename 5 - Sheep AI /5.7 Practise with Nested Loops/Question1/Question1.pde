int  numSquares;
int spaceBetween; 
float squareSize;
float sqrtSquare; 

void setup() 
{
   size(512, 512); 
   background(200, 175, 0);
   numSquares = 81;
   spaceBetween = width/200;
   sqrtSquare = sqrt(numSquares);
   squareSize = (width - (spaceBetween *(sqrtSquare +1))) / sqrtSquare;
}

void draw()
{   
    int squareRowNumber = 0;
    while (squareRowNumber < int(sqrt(numSquares)))
    {
        int squareColNumber = 0;
        while(squareColNumber < int(sqrt(numSquares)))
        {
            float squareX = (squareColNumber +1)* spaceBetween + (squareColNumber)* squareSize;
            float squareY = (squareRowNumber +1)* spaceBetween + (squareRowNumber)* squareSize;
            if (squareColNumber%2 == 0) 
            {   
                if (squareRowNumber%2 ==0) 
                {
                    fill(255, 0, 0);
                }
                else
                {
                    fill(0);
                }
            }
            else
            {
                if (squareRowNumber%2 ==0) 
                {
                    fill(0);
                }
                else
                {
                    fill(255, 0, 0);
                }
            }
            
            rect(squareX, squareY, squareSize, squareSize);
            squareColNumber++;
        }
        squareRowNumber++; 
    }
}
