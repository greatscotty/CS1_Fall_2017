// Question 3 Skipped for time being as a result or wording. 

int[] data = new int[100];
int valueReturned;  

void setup() 
{
    data[0]= 1;
    data[1]= 99;
    data[2]= 3;
    // valueReturned = findIndex(data);
}

void draw()
{
    println("findIndex Returned: "+ findIndex(data));
}

int findIndex(int[] data)
{
    int currentIndex = 0; 
    int dataSum = 0;

    while ( currentIndex < data.length ) 
    {
     
        dataSum += data[currentIndex];
        if (dataSum >= 100)
        {
            return data[currentIndex -1];
        }
        currentIndex++;
    }
    return -1;
}