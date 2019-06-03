final int numOfRect = 10;  

int[] rectX = new int[numOfRect];
color[] rectColor1 = new color[numOfRect];
color[] rectColor2 = new color[numOfRect];

final color initialRectColor = color(255);
int rectY;

void setup() 
{
    size(512, 512);
    int rectNum = 0;
    rectY = height/2;
    while (rectNum < numOfRect) 
    {
        rectX[rectNum] = rectNum * 30;
        rectColor1[rectNum] = initialRectColor;
        rectColor2[rectNum] = color(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
        rectNum++; 
    }
}

 void draw() 
{
    int rectNum = 0;
    while (rectNum < numOfRect) 
    {
    fill(rectColor1[rectNum]);
    rect(rectX[rectNum], rectY, 10, 15);
    rectNum++;
    }
}
