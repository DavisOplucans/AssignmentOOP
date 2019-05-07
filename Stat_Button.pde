class Stat_Button
{
  float w = 200; 
  float h = 45; 
  float xpos = width - 400; 
  float ypos = height - 100; 
  color text_color = color(255);
  color button_color = color(34,139,34);
  boolean clicked = false;
  
  /*
    If the mouse is clicked, mouseCLicked function will be carried out and if the mouse will be clicked in the parameters then the clicked() will be carried out.
    Depending of the variables value it will either display the main sketch in draw() or wil ldisplay a different sketch in the 'view_stat' function.
  */
  void clicked()
  {
    if(clicked)
    {
      clicked = false;
    }
    else if(!clicked)
    {
      clicked = true;
    }
  }
  void stat_button() // function will display the button
  {
    stroke(0);
    fill(button_color);
    rect(xpos, ypos, w, h);
  }
}
  /*
    Stat_Button1 is an extension of 'Stat_Buton'
    It contains the same properties as stat_button but also has a unique text which it displays
  */
class Stat_Button1 extends Stat_Button
{
  void text_display()
  {
    textSize(15);
    fill(text_color);
    text("DISPLAY STATS", 1010, 695);
  }
}
  /*
    Stat_button2 is also an extension of 'Stat_Button'
     it also has a unique text to it
  */
class Stat_Button2 extends Stat_Button
{
  void text_display()
  {
    textSize(15);
    fill(text_color);
    text("Click to return!", 1010, 695);
  }
}