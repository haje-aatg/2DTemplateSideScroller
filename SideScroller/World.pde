class World {
  byte health;
  boolean passable, destructible;
  color worldColor;

  World() {
    health = 10;
    passable = boolean(round(random(0, 1)));
    if (passable == false) {
      destructible = boolean(round(random(0, 1)));
      worldColor = color(214, 146, 43);
    } else {
      worldColor = color(38, 184, 250);
      destructible=false;
    }
  }
  World(int wHeight, int bHeight) {
    health = 10;
    if (bHeight<wHeight*0.1) {
      passable = true;
      destructible=false;
      worldColor = color(38, 184, 250);
    } else {
      if (random(0, 100)<85) {
        passable = false;
        destructible = boolean(round(random(0, 1)));
        worldColor = color(214*(int(destructible)+1)/2, 146, 43);
      } else {
        passable = true;
        destructible=false;
        worldColor = color(38, 184, 250);
      }
    }
  }
  World(boolean tempblocked) {
    health = 10;
    passable = tempblocked;
    destructible = tempblocked;
  }
  void draw(int tempXdir, int tempYdir, int tempSquaresize) {
    fill(worldColor, 255*(10-(health%10)));
    square(tempXdir*tempSquaresize, tempYdir*tempSquaresize, tempSquaresize);
  }
  void attacked(byte tdamage) {
    if (destructible) {
      health-=tdamage;
    }
    if (isDead()) {
      passable = true;
      destructible=false;
      worldColor = color(38, 184, 250);
    }
    println("Attacked World. Destructible: "+destructible+". Health left: " + health);
  }
  boolean isDead() {
    if (health>0) {
      return false;
    } else {
      return true;
    }
  }
}
