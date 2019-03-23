module trijam12.entity.entity;

import bindbc.sdl;

import trijam12.math.vector;
import trijam12.render.renderable;
import trijam12.entity.hitbox;
import trijam12.render.sprite;

abstract class Entity : Renderable {

    private: 
        Vector2!int position;

        Sprite sprite;
        Hitbox hitbox;
        
    public: 
        this(SDL_Renderer* renderer, Vector2!int initPos, int width, int height, string pathToSpritesheet, int spriteSrcWidth, int spriteSrcHeight) {
            this.position = initPos;

            this.sprite = new Sprite(renderer, "assets/sprites/notfound.png", position.getX_ptr, position.getY_ptr, width, height, spriteSrcWidth, spriteSrcHeight);
            this.hitbox = new Hitbox(position.getX_ptr, position.getY_ptr, width, height);
        }

        override void render(SDL_Renderer* renderer) {
            
        }

        Vector2!int getPosition() {
            return position;
        }

        Sprite getSprite() {
            return sprite;
        }

        Hitbox getHitbox() {
            return hitbox;
        }
        
}