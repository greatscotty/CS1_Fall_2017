int x; 
int y; 

void setup()
{
size(500,350);
background(14,54,8);
smooth();
int x = height/2;
int y = width/2;
}

void happy(int happyPositionX,int happyPositionY)
{
fill(227,217,57);
ellipseMode(CENTER);
ellipse(happyPositionX,happyPositionY,100,100);

fill(0);
ellipse(happyPositionX-20,happyPositionY-20,25,25);
ellipse(happyPositionX+20,happyPositionY-20,25,25);
arc(happyPositionX,happyPositionY,50,50,0,PI);
}

void draw()
{
happy(x,y);
}
