module trijam12.entity.hitbox;

import bindbc.sdl;

import trijam12.math.vector;
import trijam12.render.renderable;

class Hitbox : Renderable {

    private:
        int* x;
        int* y;
        int width;
        int height;

        Vector4!ubyte color;

    public:
        this(int* x, int* y, int width, int height, Vector4!ubyte color = Vector4!ubyte(255, 255, 255, 100)) {
            this.x = x;
            this.y = y;
            this.width = width;
            this.height = height;

            this.color = color;
        }

        override void update(float, float) {}

        override void render(SDL_Renderer* renderer) {
            SDL_Rect rect = SDL_Rect(*x, *y, width, height);

            SDL_SetRenderDrawColor(renderer, color.getX, color.getY, color.getZ, color.getW);
            SDL_RenderDrawRect(renderer, &rect);
        }

        bool collides(Hitbox hitbox) {
            return true; // TODO: implement this
        }

}