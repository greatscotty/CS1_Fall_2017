
int[] numbers; 
int rectNum;
final float maxRectSizeWidth = 40;
final float maxRectSizeHeight = maxRectSizeWidth * 3/4;

PFont numberFont;

void setup() 
{
    size(512, 512);
    rectNum = 10;
    numbers = randomNumberdArray(rectNum, 1, 20);
    numberFont = loadFont("Monospaced-48.vlw");

    println("maxValueIndex: "+ findMaxValueIndex(numbers));
}

void draw() 
{
    drawRect();
}

int findMaxValueIndex(int[] arrayToSort)
{
    int maxValue = -1;
    int maxValueIndex = 0;
    int index = 0; 

    while (index < arrayToSort.length)
    {
        if (arrayToSort[index] > maxValue ) 
        {
            maxValue = arrayToSort[index];
            maxValueIndex = index;
        }
        index++;
    }
    // println("maxValue: "+maxValue); // test output line
    // println("maxValueIndex: "+maxValueIndex); // test output line
    return maxValueIndex;

}

int[] randomNumberdArray( int size, int minNum, int maxNum)
{
    int[] array = new int[size]; 
    int i = 0;

    while (i < array.length)
    {
        array[i] = int(random(minNum, maxNum+1));
        // println("array[" + i + "] : " + array[i]); // test array building
        i++;
    }
   
    return array;
}

float getXCoordinateForRect(int rectNum)
{
  return (rectNum+1)*getHorizontalSpacing()
         + rectNum*maxRectSizeWidth
         + maxRectSizeWidth/2;
}

float getHorizontalSpacing()
{
  return (width - rectNum*maxRectSizeWidth)/(float)(rectNum+1);
}

void drawRect()
{
    
    rectMode(CENTER);
    int currentRect = 0;
    final float rectY = height/2;

    while (currentRect < numbers.length) 
    {   
        highlightMax(currentRect);
        rect(getXCoordinateForRect(currentRect), rectY, maxRectSizeWidth, maxRectSizeHeight);
        drawRectNumber(currentRect);
        currentRect++; 
    }
}

void drawRectNumber( int rectNum)
{   
    final float textY = height/2;

    fill(255);
    textAlign(CENTER);
    textFont(numberFont, maxRectSizeHeight/2);
    text(numbers[rectNum], getXCoordinateForRect(rectNum), textY);
}

void highlightMax(int rectNum)
{
    if(rectNum == findMaxValueIndex(numbers))
    {
        fill(220, 195, 0);
    }
    else 
    {
        fill(0);    
    }
}