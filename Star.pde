class Star
{
  float xpos = random(0, width + 50); 
  float ypos = random(0, 550);
  float r = random(0, 3); 
  float speed = random(1, 3); 
  int hit = 0;
  /*
    The function of the object will decrement the x postion of the star by 1 of the speed. 
    Once it reaches <0 it will reset to 50
  */
  void move()
  {
    xpos = xpos - speed;
    if(xpos < 0)
    {
      xpos = width + 50;
    }
  }
  /*
    This function will only be possible if the user has clicked the object instance 'b1' first.
    each time the mouse is pressed the mouses's current x,y position will be passed to this function.
    It will check that the x,y values are less then the object's width/height. If it is the variable 'hit' will be assignd the value 1.
  */
  void star_clicked(float px, float py)
  {
    float d = dist(px, py, xpos, ypos);
    if(d < r)
    {
      hit = 1;
    }
    else
    {
      hit = 0;
    }
  }
  /*
    This function will take place after the function star_clicked.
    The variable 'hit' will have its value cjecked and return a boolean value to the main program, depending on the value of 'hit'
  */
  boolean remove_s()
  {
    if(hit == 1)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  /*
    This function will display the stars onto the canvas using an ellispe that will draw the star white and with its unique x,y positions and radius in the ellipse function
    Depending on the value of 'i', if it is an odd number the star will have a yellow outline, if it is even it will contain no outline.
  */
  void display_stars(int i)
  {
    if(i % 2 == 0)
    {
      noStroke();
    }
    else
    {
      stroke(255, 255, 0);
      strokeWeight(1);
    }
    fill(255);
    ellipse(xpos, ypos, r*2, r*2);
  }
}
  