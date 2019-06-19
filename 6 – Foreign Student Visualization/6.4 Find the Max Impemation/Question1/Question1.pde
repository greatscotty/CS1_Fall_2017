
int[] numbers; 
int rectNum;
final float maxRectSizeWidth = 40;

void setup() 
{
    size(512, 512);
    rectNum = 10;
    numbers = randomNumberdArray(rectNum, 1, 20);

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
         + rectNum*maxRectSizeWidth;
}

float getHorizontalSpacing()
{
  return (width - rectNum*maxRectSizeWidth)/(float)(rectNum+1);
}

void drawRect()
{
    final float rectY = height/2;
    final float maxRectSizeHeight = maxRectSizeWidth * 3/4;

    int currentRect = 0; 

    while (currentRect < numbers.length) 
    {      
        rect(getXCoordinateForRect(currentRect), rectY, maxRectSizeWidth, maxRectSizeHeight);
        currentRect++; 
    }
}