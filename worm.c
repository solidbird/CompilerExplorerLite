#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <termios.h>
#include <stdbool.h>
#include <pthread.h>
#include <time.h>

#include <raylib.h>
#include <raymath.h>

#define FPS_LIMIT 120

#define SCREEN_WIDTH 800
#define SCREEN_HEIGHT 800

#define CELL_COUNT_X 50
#define CELL_COUNT_Y 50

#define CELL_WIDTH ( SCREEN_WIDTH / CELL_COUNT_X )
#define CELL_HEIGHT ( SCREEN_HEIGHT / CELL_COUNT_Y )

#define SPEED 150

typedef struct Player{
	Rectangle rect;
	struct Player* child_player;
	struct Player* parent_player;
	Vector2 old_position;
	Color color;
} Player;

static char KEY;

static inline bool point_within_player(const Player* head_player, Vector2 p);
static inline Vector2 random_star(const Player *head_player);
void domino_positions(Player* head_player);
void extend_player(const Player* head_player);
static inline void draw_player(Player* head_player);
int count_players(Player* p);


int main(int argc, char **argv){
	InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Worm Game - v0.1");
	SetTargetFPS(FPS_LIMIT);

	Player* head_player = (Player*) malloc(sizeof(Player));
	head_player->rect = (Rectangle) {
		GetRandomValue(0, CELL_COUNT_X-1) * CELL_WIDTH,
	 	GetRandomValue(0, CELL_COUNT_Y-1) * CELL_HEIGHT,
		50,
		50
	};
	head_player->child_player = NULL;
	head_player->parent_player = NULL;
	head_player->old_position = (Vector2){0};
	head_player->color = RED;

	Vector2 velocity = (Vector2){1./FPS_LIMIT * SPEED, 1./FPS_LIMIT * SPEED};
	int hold_key = KEY_NULL;
	Vector2 pos_star = random_star(head_player);
	Rectangle rect_star = (Rectangle){pos_star.x, pos_star.y, 30, 30};
	char* game_score = (char*)malloc(25 * sizeof(char));

	while(!WindowShouldClose()){
		printf("x: %f, y: %f   key:%d\n", head_player->rect.x, head_player->rect.y, count_players(head_player));
		
		head_player->old_position = (Vector2){ head_player->rect.x, head_player->rect.y };
	
		if(hold_key == KEY_UP || IsKeyDown(KEY_UP)){
			head_player->rect.y -= velocity.y;
			hold_key = KEY_UP;
		}
		if(hold_key == KEY_DOWN || IsKeyDown(KEY_DOWN)){
			head_player->rect.y += velocity.y;
			hold_key = KEY_DOWN;
		}
		if(hold_key == KEY_RIGHT || IsKeyDown(KEY_RIGHT)){
			head_player->rect.x += velocity.x;
			hold_key = KEY_RIGHT;
		}
		if(hold_key == KEY_LEFT || IsKeyDown(KEY_LEFT)){
			head_player->rect.x -= velocity.x;
			hold_key = KEY_LEFT;
		}

		if(head_player->rect.y > SCREEN_HEIGHT - 3*CELL_HEIGHT ){
			head_player->rect.y = SCREEN_HEIGHT-3*CELL_HEIGHT;	
		}
		if(head_player->rect.y < 0){
			head_player->rect.y = 0;
		}
		if(head_player->rect.x < 0){
			head_player->rect.x = 0;
		}
		if(head_player->rect.x > SCREEN_WIDTH - 3*CELL_WIDTH ){
			head_player->rect.x = SCREEN_WIDTH-3*CELL_WIDTH;	
		}

		sprintf(game_score, "Game score: %d", count_players(head_player));
		
		//Vector2Equals(pos_star,  head_player_pos)
		Vector2 head_player_pos = (Vector2){head_player->rect.x, head_player->rect.y};
		if(CheckCollisionRecs(head_player->rect, rect_star)){
			pos_star = random_star(head_player);
			rect_star = (Rectangle){ pos_star.x, pos_star.y, 30., 30. };
			extend_player(head_player);
		}

		domino_positions(head_player);
		
		BeginDrawing();
		draw_player(head_player);
		DrawRectangleRec(rect_star, BLUE);
		DrawText(game_score, 0, 0, 12, GREEN);
		DrawFPS(SCREEN_WIDTH-100, 0);
		ClearBackground(BLACK);
		EndDrawing();
	}

	CloseWindow();

    return 0;
}

static inline Vector2 random_star(const Player *head_player){
	
    Vector2 pn;
    do{
		pn.x = GetRandomValue(0, SCREEN_HEIGHT - CELL_HEIGHT*3);
		pn.y = GetRandomValue(0, SCREEN_WIDTH - CELL_WIDTH*3);
	}while(point_within_player(head_player, pn));

    return pn;
}

static inline bool point_within_player(const Player* head_player, Vector2 p){
	Player* player_next = head_player;
	while(player_next != NULL){
		if(p.x == player_next->rect.x && p.y == player_next->rect.y){
			return true;
		}
		
		player_next = player_next->child_player;
	}

	return false;
}

void extend_player(const Player* head_player){
    Player* next_player = head_player;
    
	while(next_player->child_player != NULL){
        next_player = next_player->child_player;
	}
	
	Player* new_player = (Player*) malloc(sizeof(Player));
	
	if(new_player == NULL){
		printf("Buy more RAM!");
		exit(1);
	}
	Rectangle rec_new_player = {
		.x = next_player->old_position.x,
		.y = next_player->old_position.y,
		.width = next_player->rect.width,
		.height = next_player->rect.height
	};	

	new_player->rect = rec_new_player;
	new_player->child_player = NULL;
	new_player->parent_player = next_player;
	new_player->old_position = (Vector2){0};
	new_player->color = next_player->color;

	next_player->child_player = new_player;
}

void domino_positions(Player* head_player){
    Player* next_player = head_player;
    while(next_player->child_player != NULL){
        Vector2 old_pos = next_player->old_position;
        next_player = next_player->child_player;
        next_player->old_position = (Vector2){next_player->rect.x, next_player->rect.y};
       	//TODO DOESNT WORK WELL 
		//Vector2 parent_pos = {next_player->parent_player->rect.x, next_player->parent_player->rect.y};
		Vector2 new_pos = old_pos;//Vector2Subtract(parent_pos, Vector2Scale(old_pos, 2.0)); 

		printf("%.5f, %.5f", new_pos.x, new_pos.y);
		next_player->rect = (Rectangle){
			new_pos.x,
			new_pos.y,
			next_player->rect.width,
			next_player->rect.height
		};
    }
}

static inline void draw_player(Player* head_player){
	Player* next_player = head_player;
	DrawRectangleRec(next_player->rect, next_player->color);
	while(next_player->child_player != NULL){
		next_player = next_player->child_player;
		DrawRectangleRec(next_player->rect, next_player->color);
	}
}

int count_players(Player* p){
    int i = 0;
    Player* tmp_player = p;

    while(tmp_player->child_player != NULL){
        tmp_player = tmp_player->child_player;
        i = i + 1;
    }

    return i;
}
