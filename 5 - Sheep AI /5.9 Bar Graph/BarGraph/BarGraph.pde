
size(512, 512);
background(255);

final int numPoints =10; 
final int axisX = 20; 
final int axisY = height - 20;

int[] points = new int[numPoints]; // declare the array

int pointNum = 0; 
while (pointNum < numPoints)
{
    points[pointNum] = int(random(height - axisY, axisY)); //assign some random values to the Y values
    pointNum++;
}

int barSpacing = (width - 2*axisX)/numPoints;

line(axisX, axisY, axisX, height -axisY); //draw Y axis
line(axisX, axisY, width - axisX, axisY); //draw X axis

pointNum = 0;
while(pointNum < numPoints)
{
    if (pointNum %2 == 0 ) 
    {
        fill(255, 0, 0);    
    }
    else 
    {
        fill(0, 0, 255);    
    }

    rect((barSpacing * pointNum) + axisX , points[pointNum], barSpacing, axisY - points[pointNum] );
    pointNum++;
}