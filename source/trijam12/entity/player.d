module trijam12.entity.player;

import trijam12.entity.entity;
import trijam12.math.vector;

class Player : Entity {

    public:
        this() {
            super(Vector2!int(0, 0), 40, 40, pathToSpritesheet, 32, 32);
        }

}