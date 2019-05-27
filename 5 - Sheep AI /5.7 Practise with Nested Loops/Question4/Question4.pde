int floorSpacing;
int floorNumber;
int windowSpacing;
int floorWidth;
int floorHeight;

void setup()
{
    size(512, 512); 
    floorSpacing = height/22;
    floorHeight = height/22;
    floorWidth = width* 3/4;
    floorNumber = -0;
    rectMode(CENTER); 
}

void draw() 
{
    drawFloor();
}

void drawFloor()
{
    while (floorNumber < 20) 
    {
        rect(width/2 , ((height - floorSpacing/2 ) - ( floorNumber * floorSpacing)), width * 3/4, floorSpacing );
        drawWindows();
        floorNumber++;
    }
    
}

void drawWindows()
{
    int windowNumber = 0; 
    while (windowNumber < 10)
    {
        rect( ((floorWidth/11) * (windowNumber + 1 ) + (width/8)),
         ((height - floorSpacing/2 ) - ( floorNumber * floorSpacing)) ,
         (floorWidth) / 20,
          floorSpacing/2);
         windowNumber++; 
    }
}