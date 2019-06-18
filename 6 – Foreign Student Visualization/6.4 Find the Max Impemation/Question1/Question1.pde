// int[] numbers = { 1, 2, 3, 4, 5, 10, 7, 8, 9, 0};
int[] numbers; 

void setup() 
{
    numbers = randomNumberdArray(10, 1, 20);
    println("maxValueIndex: "+ findMaxValueIndex(numbers));
}

void draw() 
{
    
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