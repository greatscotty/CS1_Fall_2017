
boolean randomBool(float p)
{   
    float randomNum = random(0, 1);
    println("randomNum: "+randomNum);

    if ( randomNum <= p )
    {
        return true; 
    }
    else
    {
        return false;    
    }
}

void setup() 
{
    println("randomBool: "+randomBool(0.75));
}

