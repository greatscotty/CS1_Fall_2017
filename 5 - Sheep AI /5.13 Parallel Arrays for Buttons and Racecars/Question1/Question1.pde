final int numOfRect = 10;  

int[] rectX = new int[numOfRect];
color[] rectColor1 = new color[numOfRect];
color[] rectColor2 = new color[numOfRect];
boolean[] colourSwap = new boolean[numOfRect];

final color initialRectColor = color(255);
int rectY;
int spacing;
int rectWidth;
int rectHeight;

void setup() 
{
    size(512, 512);

    rectMode(CENTER);
    int rectNum = 0;
    
    spacing = 10; 

    rectY = height/2;
    rectWidth = (width - (spacing * (numOfRect + 1))) / numOfRect; //size of a single rect.
    rectHeight = 2 * rectWidth;
    

    while (rectNum < numOfRect) 
    {
        rectX[rectNum] =  (rectNum * rectWidth) + (spacing * (rectNum+1) + rectWidth/2);
        rectColor1[rectNum] = initialRectColor;
        rectColor2[rectNum] = color(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
        colourSwap[rectNum] = false;
        rectNum++; 
    }
}

 void draw() 
{
    int rectNum = 0;
    while (rectNum < numOfRect) 
    {
        if (colourSwap[rectNum] == true)
        {
            fill(rectColor2[rectNum]);
        }
        else
        {
            fill(rectColor1[rectNum]);
        }
        rect(rectX[rectNum], rectY, rectWidth, rectHeight);
        rectNum++;
    }
}

void mouseMoved() 
{
    int rectNum = 0; 
    if (mouseY >= rectY - rectHeight && mouseY <= rectY + rectHeight)
    {
        while (rectNum < rectX.length)
        {
            if (mouseX >= rectX[rectNum] - rectWidth/2 && mouseX <= rectX[rectNum] + rectWidth/2)
            {
                colourSwap[rectNum] = true;
            }
            else
            {
                colourSwap[rectNum] = false;
            }
            rectNum++;
        }
    }
}
