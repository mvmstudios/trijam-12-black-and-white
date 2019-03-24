module trijam12.entity.entity;

import bindbc.sdl;

import trijam12.math.vector;
import trijam12.render.renderable;
import trijam12.entity.hitbox;
import trijam12.render.sprite;

abstract class Entity : Renderable {

    public: 
        Vector2!int position;

        Sprite sprite;
        Hitbox hitbox;
        
        this(Vector2!int initPos, Sprite sprite, Hitbox hitbox) {
            this.position = initPos;

            this.sprite = sprite;
            this.hitbox = hitbox;
        }

        override void update(float deltaTime, float globalTime) {
            sprite.update(deltaTime, globalTime);
            hitbox.update(deltaTime, globalTime);
        }

        override void render(SDL_Renderer* renderer) {
            sprite.render(renderer);
            hitbox.render(renderer); // RENDER HITBOX |DEBUG|
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