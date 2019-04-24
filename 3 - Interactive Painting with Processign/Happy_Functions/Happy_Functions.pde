void setup()
{
size(500,350);
background(14,54,8);
smooth();
}

void draw()
{
happy();
}

void happy()
{
fill(227,217,57);
ellipseMode(CENTER);
ellipse(100,100,100,100);

fill(0);
ellipse(80,80,25,25);
ellipse(120,80,25,25);
arc(100,100,50,50,0,PI);
}
