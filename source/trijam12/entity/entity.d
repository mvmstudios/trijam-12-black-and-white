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
        this(Vector2!int initPos, int width, int height, string pathToSpritesheet) {
            this.position = initPos;

            this.sprite = new Sprite(position.getX_ptr, position.getY_ptr, width, height);
            this.hitbox = new Hitbox(position.getX_ptr, position.getY_ptr, width, height);
        }

        override void render(SDL_Renderer* renderer) {
            
        }
        
}