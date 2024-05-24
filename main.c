#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "resources.h"
#include <raylib.h>


void setup_line_numbers(){
	int text_width_last = 0;
 	int text_width_current = 0;
	char* editor_lines;

	for(int i = SCREEN_HEIGHT; i >= 0; i-=FONT_SIZE){
		asprintf(&editor_lines, "%d:", i/FONT_SIZE);

		text_width_current = MeasureText(editor_lines, FONT_SIZE);
		TraceLog(LOG_WARNING, "ext width for '%s' is %d", editor_lines, text_width_current);
			
		DrawText(editor_lines, 0, i, FONT_SIZE, WHITE);
	}
}

void text_area(Vector2 pos, Vector2 size, float border_thickness, Color color){
	char text_buffer[(int)size.x/FONT_SIZE];

	Rectangle text_area_border = {
			.x = pos.x,
			.y = pos.y,
			.width = size.x,
			.height = size.y
	};
 	
	DrawRectangleLinesEx(text_area_border, border_thickness, color);
	//TODO MAKE THIS SHIT WORK
	//const char c* = GetCharPressed();

	//if(c != 0){
	//	strncat(text_buffer, &c, 1);
	//	TraceLog(LOG_WARNING, "Key pressed: %d", c);
	//}
	
	DrawText("HELLO WORLD", pos.x + 5, pos.y + 5, FONT_SIZE, color);

}


int main(){

	InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, TITLE_TEXT);
	
	while(!WindowShouldClose()){
		BeginDrawing();

		DrawLineV(
			(Vector2){ SCREEN_WIDTH/2, 0 },
			(Vector2){ SCREEN_WIDTH/2, SCREEN_HEIGHT },
			WHITE
		);

		//setup_line_numbers();		
		text_area((Vector2){0, 0}, (Vector2){SCREEN_WIDTH/2, SCREEN_HEIGHT}, 2.5f, BLUE);

		EndDrawing();
	}
	
	return 0;
}
