module trijam12.render.sprite;

import std.math : round;

import bindbc.sdl;

import trijam12.math.vector;
import trijam12.render.renderable;

class Sprite : Renderable {

    private:
        int* x;
        int* y;
        int width;
        int height;

        Vector2!int spriteRange;
        bool playAnimation;

        int currentSprite;

    public:
        this(int* x, int* y, int width, int height, Vector2!int spriteRange = Vector2!int(1, 1), bool playAnimation = true) {
            this.x = x;
            this.y = y;
            this.width = width;
            this.height = height;
            
            this.spriteRange = spriteRange;

            this.playAnimation = playAnimation;

            this.currentSprite = 0;
        }

        override void update(float, float globalTime) {
            if (!playAnimation)
                return;

            if (!(globalTime % 0.1 == 0))
                return;

            currentSprite++;

            if (currentSprite > spriteRange.getY)
                currentSprite = spriteRange.getX;
        }

        override void render(SDL_Renderer* renderer) {

        }

}