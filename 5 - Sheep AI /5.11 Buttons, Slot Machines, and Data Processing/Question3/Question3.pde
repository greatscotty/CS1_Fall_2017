// Question 3 Skipped for time being as a result or wording. 

int[] data = new int[100];
int valueReturned;  

void setup() 
{
    data[0]= 1;
    data[1]= 2;
    data[2]= 3;
    data[3]= 4;
    data[4]= 5;
    data[5]= 6;
    data[6]= 80;

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
        if (dataSum < 100)
        {
            dataSum += data[currentIndex];
            if (dataSum >= 100)
            {
                return data[currentIndex -1];
            }
        }
        currentIndex++;
    }
    return -1;
}