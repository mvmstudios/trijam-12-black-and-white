module trijam12.render.sprite;

import std.math : round;

import bindbc.sdl;
import bindbc.sdl.image; 

import trijam12.math.vector;
import trijam12.render.renderable;

class Sprite : Renderable {

    private:
        SDL_Texture* spriteTexture;

        int* x;
        int* y;
        int width;
        int height;

        int srcWidth;
        int srcHeight;

        Vector2!int spriteRange;
        bool playAnimation;

        int currentSprite;
        bool rotated;

    public:
        this(SDL_Renderer* r, string pathToFile, int* x, int* y, int width, int height, int srcWidth, int srcHeight, Vector2!int spriteRange = Vector2!int(1, 1), bool playAnimation = true) {
            SDL_Surface* surface = IMG_Load(pathToFile.ptr); 
            
            spriteTexture = SDL_CreateTextureFromSurface(r, surface);

            SDL_FreeSurface(surface);

            this.x = x;
            this.y = y;
            this.width = width;
            this.height = height;

            this.srcWidth = srcWidth;
            this.srcHeight = srcHeight;
            
            this.spriteRange = spriteRange;

            this.playAnimation = playAnimation;

            this.currentSprite = 0;
            this.rotated = false;
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
            SDL_Rect srcRect = SDL_Rect(srcWidth * currentSprite, 0, srcWidth, srcHeight);
            SDL_Rect destRect = SDL_Rect(*x, *y, width, height);

            SDL_RenderCopyEx(renderer, spriteTexture, &srcRect, &destRect, 0, NULL, rotated);
        }

        int getCurrentSprite() {
            return currentSprite;
        }

}