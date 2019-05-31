final color[] slotReelColours = 
{
    color(255, 0, 0), //red 
    color(230, 130 , 50), // orange
    color(245 , 200, 70), //yellow
    color(0, 255, 0), // green
    color(0, 0, 255), // blue
};

int reelY;
int reelWidth; 
int reelHeight;

final int numberOfReels = 3; 

int[] reelPosition = new int[numberOfReels];
int[] reelX = new int[numberOfReels];
int[] reelSpinSpeed = { 5, 8, 10};

int startandStopX;
int startandStopY;
int startandStopWidth;
int startandStopHeight;
    
boolean reelsSpinning;

void setup()
{
    size(512, 512);
    rectMode(CENTER); 

    reelY =  height/2;
    reelWidth = width/ (3*numberOfReels) ;
    reelHeight = height/8 ;
    reelsSpinning = true;

    startandStopX = width* 4/5;
    startandStopY = height * 4/5;

    startandStopWidth = width/6;
    startandStopHeight = height/15;

    randomizeReelPositions();
    setReelX();
}

void draw()
{
    drawReels();
    drawStartandStopButtons();
}

void randomizeReelPositions()
{
    int i = 0; 
    while (i < reelPosition.length)
    {
        reelPosition[i] = int(random(0, (slotReelColours.length) ));
        i++;
    }
}

void setReelX()
{
    int arrayIndex = 0;
    while (arrayIndex < reelX.length)
    {
        reelX[arrayIndex] = ((arrayIndex+1) * (width/(numberOfReels + 1)));
        arrayIndex++;
    }
}

void drawReels()
{ 
    int arrayIndex = 0;
    while(arrayIndex < reelX.length)
    { 
        fill(slotReelColours[ reelPosition[arrayIndex] ]);
        rect(reelX[arrayIndex], reelY, reelWidth, reelHeight);
        arrayIndex++;
    }
    if (reelsSpinning == true)
    {
        spinReels();
    }
    
}

void spinReels()
{
    int i = 0;
    while( i < reelPosition.length)
    {
        if( reelPosition[i] < (slotReelColours.length -1))
        {
            if (frameCount % reelSpinSpeed[i] == 0)
            {
            reelPosition[i]++;
            }
        }
        else 
        {
        reelPosition[i]= 0;    
        }
        i++;
    }
}

void  drawStartandStopButtons()
{   
    if(reelsSpinning == true)
    {   
        fill(255, 0, 0);
    }
    else
    {
        fill(0, 255, 0);
    }
    rect(startandStopX, startandStopY, startandStopWidth, startandStopHeight);
 
}

void mouseClicked() 
{ 
    if (mouseX >= startandStopX - startandStopWidth/2 && mouseX <= startandStopX + startandStopWidth/2)
    {
        if(reelsSpinning == true)
        {
            reelsSpinning = false;
        }
        else 
        {
            reelsSpinning = true;
        }
    }
}