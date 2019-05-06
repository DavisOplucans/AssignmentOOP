T_Button b1; 
Identifier_Button b2; 
Identifier id1;  
Spaceship ship; 
Target t1; 
Radar radar; 
Stat_Button1 stat_button;
Stat_Button2 stat_button2;


PImage[] p = new PImage[6]; 
PImage[] a = new PImage[4]; 



Planet[] planets = new Planet[6]; 
ArrayList<Star> stars; 
ArrayList<Asteroid> asteroids;
float xpos = 1336 + 100; 

String[] planet_names = {"Mars", "Earth", "Galcantia", "Revlet", "DeathStar", "PICKLE RICK"}; 
float[] planet_ypos = {40, 100, 200, 250, 300, 400}; 

int removed_stars = 0; 
int removed_asteroids = 0; 

import controlP5.*;

ControlP5 cp5;
int music = 0;

import ddf.minim.*;

Minim minim;

AudioPlayer player;
AudioPlayer laser;

void setup()
{
  /* All measurments are in realation to the size of my screen: 1366 x 768 */
  fullScreen();
  b1 = new T_Button(); 
  b2 = new Identifier_Button();
  id1 = new Identifier();
  t1 = new Target();
  ship = new Spaceship();
  radar = new Radar();
  stat_button = new Stat_Button1();
  stat_button2 = new Stat_Button2();
  

  
  stars = new ArrayList<Star>(); 
  for(int i = 0; i < 150;  i++)
  {
    stars.add(new Star());
  } 
  
  for(int i = 0; i < planets.length; i++)
  {
    p[i] = loadImage("planet"+i+".png");
    planets[i] = new Planet(p[i], planet_names[i], planet_ypos[i]);
  }
  
  asteroids = new ArrayList<Asteroid>(); 
  for(int i = 0; i < 4; i++)
  {
    a[i] = loadImage("asteroid"+i+".png");
    asteroids.add(new Asteroid(a[i]));
  }
  
  minim = new Minim(this); 
  player = minim.loadFile("Apex.mp3");
  player.loop(); 
  laser = minim.loadFile("Laser.mp3");
  
  cp5 = new ControlP5(this); 
  cp5.addSlider("music")
  .setPosition(100, (height / 100) * 95)
  .setRange(0, 1); 
}

void draw()
{
  if(stat_button.clicked)
  {
    view_stats();
  }
  else
  {
    background(0);
    draw_planets();
    draw_stars();  
    draw_asteroids(); 
 
    ship.display(); 
    b1.display_b(); 
    b2.display_i();
    radar.draw_radar(); 
    
    if(b2.light)
    {
      for(int i = asteroids.size()-1; i >= 0; i--)
      {
        Asteroid a1 = asteroids.get(i);
        a1.rollover(mouseX, mouseY);
      }
      
      for(int i = 0; i < planets.length; i++)
      {
        planets[i].rollover(mouseX, mouseY); 
      }
    }
    
    if(b1.on)
    {
      for(int i = 0; i < planets.length; i++)
      {
         planets[i].scan(mouseX, mouseY); 
      }
    }
    
    stat_button.stat_button(); 
    stat_button.text_display(); 
    
    if(b1.on)
    {
   
      t1.display_t();
    }
    if(b2.light)
    {
   
      id1.display_id();
    }
  }
  wave_length(); 
  fill(0,0,139);
  textSize(15);
  text("Play music", 110, 700);
}

void mousePressed()
{
  if(!b2.light)
  {
    b1.clicked_b(mouseX, mouseY);
  }
  
  if(!b1.on)
  {
    b2.clicked_i(mouseX, mouseY);
  }
  
  if(b1.on)
  {
    for(int i = stars.size()-1; i >= 0; i--)
    {
      Star b = stars.get(i);
      b.star_clicked(mouseX, mouseY);
    }
    
    for(int i = asteroids.size()-1; i >= 0; i--)
    {
      Asteroid a1 = asteroids.get(i);
      a1.asteroid_clicked(mouseX, mouseY);
    }
  }
}

void mouseClicked()
{
  if(mouseX > width - 400 && mouseX < width - 400 + 200 && mouseY > height - 100 && mouseY < height - 100 + 45)
  {
    stat_button.clicked();
  }
}

void draw_planets()
{
  for(int i = 0; i < planets.length; i++)
  {
    planets[i].move(); 
    planets[i].display(); 
  }
}


void draw_stars()
{
 for(int i = stars.size()-1; i >= 0; i--)
 {
   Star b = stars.get(i);
   b.display_stars(i);
   b.move();
  
   if(b.remove_s())
   {
     laser.rewind();
     laser.play();
     stars.remove(i);
     stars.add(new Star());
     removed_stars++;
    }
  }
}

void draw_asteroids()
{
 for(int i = asteroids.size()-1; i >= 0; i--)
 {
   Asteroid a1 = asteroids.get(i); 
   a1.display();
   a1.move();
   if(a1.remove_a())
   {
    laser.rewind();
    laser.play();
    asteroids.remove(i);
    asteroids.add(new Asteroid(a[i], xpos));
    removed_asteroids++;
   }
  }
}

void wave_length()
{
  fill(0);
  stroke(218, 112, 214);
  rect(350, 600, 160, 90);
  if(music == 1)
  {
    player.play();
    for(int i = 0; i < player.bufferSize() - 1; i++)
    {
      stroke(255);
      float x1 = map(i, 0, player.bufferSize(), 350, 510);
      float x2 = map(i+1, 0, player.bufferSize(), 350, 510);
      line(x1, 645 + player.right.get(i) * 50, x2, 645 + player.right.get(i+1) * 50);
    }
  }
  else
  {
    player.pause();
    stroke(255);
    strokeWeight(3);
    line(350, 645, 510, 645);
  }
}
void view_stats()
{
  background(95,158,160);
  stat_button2.stat_button();
  stat_button2.text_display();
  fill(255);
  rect(100, 50, 400, 400);
  rect(600, 50, 480, 400);
  textSize(40);
  fill(0);
  text("Stars destroyed", 150, 100);
  text(removed_stars, 280, 300);
  text("Asteroids destroyed", 650, 100);
  text(removed_asteroids, 840, 300);
}