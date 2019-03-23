module trijam12.render.renderable;

import bindbc.sdl;

interface Renderable {
    public:
        void update(float deltaTime = 0.0, float globalTime = 0.0);
        void render(SDL_Renderer* renderer);
}