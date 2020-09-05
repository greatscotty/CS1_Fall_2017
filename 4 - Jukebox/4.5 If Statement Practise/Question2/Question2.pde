color colour1 = color(115, 71, 243);
color colour2 = color(236, 248, 84);

void setup() {
    size(1000,800);
}

void draw() {

    if (((mouseX >= width/3.0) && (mouseX <= (2.0*width/3.0))) && ((mouseY >= height/3.0) && (mouseY <= (2.0*height/3.0))))  {
        background(colour2);
        fill(colour1);
    }
    else {
        background(colour1);
        fill(colour2);
    }
    
    rectMode(CENTER);
    rect(width/2.0,height/2.0,width/3.0,height/3.0);
}
