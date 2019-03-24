module trijam12.entity.player;

import bindbc.sdl;

import trijam12.entity.entity;
import trijam12.math.vector;
import trijam12.render.sprite;
import trijam12.entity.hitbox;

class Player : Entity {

    public:
        this(SDL_Renderer* renderer) {
            //SDL_Renderer* r, string pathToFile, int* x, int* y, int width, int height, int srcWidth, int srcHeight, Vector2!int spriteRange = Vector2!int(1, 1), bool playAnimation = true
            super(Vector2!int(0, 0), 
                new Sprite(renderer, "assets/sprites/player.png", 
                    super.position.getX_ptr, super.position.getY_ptr, 128, 256, 263, 207, Vector2!int(0, 2)),
                new Hitbox(super.position.getX_ptr, super.position.getY_ptr, 128, 256));
        }

        override void update(float deltaTime, float globalTime) {
            super.update(deltaTime, globalTime);
        }

        override void render(SDL_Renderer* renderer) {
            super.render(renderer);
        }

}