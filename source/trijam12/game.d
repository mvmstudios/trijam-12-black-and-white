module trijam12.game;

import bindbc.sdl;

import trijam12.entity.player;
import trijam12.render.renderable;

class Game : Renderable {

    private:
        SDL_Renderer* renderer;

        Player player;

    public:
        this(SDL_Renderer* renderer) {
            this.player = new Player(renderer);
        }

        override void update(float deltaTime, float globalTime) {
            player.update(deltaTime, globalTime);
        }

        override void render(SDL_Renderer* renderer) {
            player.render(renderer);
        }

}