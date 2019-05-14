int x1;
int x2;
int x3;

int y1;
int y2;
int y3;

final int circleSize = 10;
final color circleColour = color(240, 240, 60);
final color triangleColour = color(100, 225, 60);



void setup()
{
    size(512, 512);    
    background(85, 35, 145);
}

void draw()
{
}

void mousePressed()
{   
    if (x1 == 0 &&  y1 == 0)
    {   
        x1 = mouseX; 
        y1 = mouseY;
        drawCircle(x1, y1);
    }
    else if (x2 == 0 &&  y2 == 0)
    {
        x2 = mouseX; 
        y2 = mouseY;
        drawCircle(x2, y2);
    }
    else if (x3 == 0 &&  y3 == 0)
    {
        x3 = mouseX; 
        y3 = mouseY;
        drawCircle(x3, y3);
        drawTriangle(x1, y1, x2, y2, x3, y3);
    }
}

void drawTriangle(int triangleX1, int triangleY1, int triangleX2, int triangleY2, int triangleX3, int triangleY3)
{
    fill(triangleColour);
    triangle(triangleX1, triangleY1, triangleX2, triangleY2, triangleX3, triangleY3);

    x1 = 0;
    x2 = 0;
    x3 = 0;
    y1 = 0;
    y2 = 0;
    y3 = 0;
}

void drawCircle(int x, int y)
{
    fill(circleColour);
    ellipse(x, y, circleSize, circleSize);
}