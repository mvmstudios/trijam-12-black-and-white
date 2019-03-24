import std.stdio;

import bindbc.sdl;
import bindbc.sdl.image; 

import trijam12.game;

void main() {
	loadSDL();
	loadSDLImage();

	SDL_Window* window = SDL_CreateWindow("Trijam 12 | Black and White", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 800, 600, SDL_WINDOW_RESIZABLE);
	SDL_Renderer* renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC);

	Game game = new Game(renderer);

	ulong performanceCounterFrequency = SDL_GetPerformanceFrequency();
	ulong lastPerformanceFrequency = performanceCounterFrequency; 

	float deltaTime = 0.0;
	float globalTime = 0.0;

	bool closeRequested = false;
	while (!closeRequested) {
		SDL_Event event;
		while (SDL_PollEvent(&event)) {
			switch (event.type) {
				case SDL_QUIT:
					closeRequested = true;
					break;
				default:break;
			}
		}

		SDL_RenderClear(renderer);

		globalTime += deltaTime;

		game.update(deltaTime, globalTime);
		game.render(renderer);

		SDL_RenderPresent(renderer);

		long endPerformanceCount = SDL_GetPerformanceCounter();
		long timeElapsed = endPerformanceCount - lastPerformanceFrequency;

		deltaTime = (cast(float) timeElapsed) / cast(float) performanceCounterFrequency;
		//uint framesPerSecond = cast(uint) (cast(float) performanceCounterFrequency / cast(float) timeElapsed);

		lastPerformanceFrequency = endPerformanceCount;
	}
	
}
