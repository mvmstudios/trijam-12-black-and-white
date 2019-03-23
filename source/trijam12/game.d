module trijam12.game;

import bindbc.sdl;

import trijam12.entity.player;
import trijam12.render.renderable;

class Game : Renderable {

    private:
        static Game _instance;

        Player player;

    public:
        override void update(float, float) {}

        override void render(SDL_Renderer* renderer) {

        }

        static Game instance() {
            if (!_instance)
                _instance = new Game;

            return _instance;
        }

}