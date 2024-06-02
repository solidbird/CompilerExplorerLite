#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <raylib.h>

#include "map_src_list.h"
#include "resources.h"

char* copy_string(char *s){
	char* s2;
	s2 = (char*) malloc(strlen(s)+1);
	strcpy(s2, s);
	return (char*)s2;
}

void block_until_next(FILE *fp, MapSrc* node, long last_pos, char* src_filename){
	char *asm_line = NULL;
	size_t asm_len = 0;
	ssize_t asm_read;

	fseek(fp, last_pos, SEEK_SET);

	char* commentline = "";
	asprintf(&commentline, "# %s:", src_filename);
	int i = 0;
	char* tmp;
	while ((asm_read = getline(&asm_line, &asm_len, fp)) != -1) {
		if( (tmp =  strstr(asm_line, ".globl")) != NULL ){
			//node->src_line = tmp;
			//node->src_line[0] = '\n'; 
			break;
		}
		if(strstr(asm_line, commentline) != NULL){
			break;
		}
		i++;
		strcat(node->asm_block, asm_line);
	}

	fseek(fp, last_pos, SEEK_SET);
	node->asm_line_count = i;	
}

MapSrc* prepare_src_asm_mapping(char* asm_file, char* src_file){
	FILE *asm_fp;
	char *asm_line = NULL;
	size_t asm_len = 0;
	ssize_t asm_read;

	asm_fp = fopen(asm_file, "r");

	char* commentline = "";
	asprintf(&commentline, "# %s:", src_file);

	MapSrc* head_node = (MapSrc*) malloc(sizeof(MapSrc));
	
	while ((asm_read = getline(&asm_line, &asm_len, asm_fp)) != -1) {
		long last_pos = ftell(asm_fp);

		if(strstr(asm_line, commentline) != NULL){
			char* inner_comment = strstr(asm_line, ":") + 1;
			int line_num = atoi(inner_comment);
		 	
			MapSrc node = {
				.filename = src_file,
				.src_line = copy_string(strstr(asm_line,strstr(inner_comment, ":") + 1)),
				.line_count = line_num,
				.color = (Color){rand() % (255 + 1), rand() % (255 + 1), rand() % (255 +1), 255},
			};
			block_until_next(asm_fp, &node, last_pos, src_file);
			
			add_node(head_node, node);
		}
	}

	fclose(asm_fp);

	return head_node;
}

void create_buid_asm(char* src_file){
	const char *cmd_build_asm = "/bin/gcc";
	
	char asm_file[100], file_end[100];
	strcpy(asm_file, src_file);
	strcpy(file_end, ".s");
	strcat(asm_file, file_end);

	char * const args[] = {"gcc", "-S", "-Iincludes","-fverbose-asm", "-masm=intel", src_file, "-o", asm_file, NULL};
	execv(cmd_build_asm, args);

}

// Weird memory leak with this
void setup_line_numbers(Vector2 pos){
	int text_width_last = 0;
 	int text_width_current = 0;
	char* editor_lines = "0:";

	for(int i = FONT_SIZE; i <= SCREEN_HEIGHT; i+=FONT_SIZE){
		asprintf(&editor_lines, "%s\n%d:", editor_lines, i/FONT_SIZE);
	}
	DrawText(editor_lines, 0, 0, FONT_SIZE, WHITE);
}

void ftext_area(Vector2 pos, Vector2 size, Color color, float border_thickness, char filepath[]){
	char text_buffer[(int)size.x/FONT_SIZE];
	char* filedata = LoadFileText(filepath);

	
	Rectangle text_area_border = {
			.x = pos.x,
			.y = pos.y,
			.width = size.x,
			.height = size.y
	};

	setup_line_numbers((Vector2){text_area_border.x +5 , text_area_border.y+5});
 	
	DrawRectangleLinesEx(text_area_border, border_thickness, color);
	DrawText(filedata, pos.x, pos.y, FONT_SIZE, color);
}

void text_area(Vector2 pos, Vector2 size, Color color, float border_thickness, char* txt){
	char text_buffer[(int)size.x/FONT_SIZE];

	Rectangle text_area_border = {
			.x = pos.x,
			.y = pos.y,
			.width = size.x,
			.height = size.y
	};

	// Weird memory leak with this
	//setup_line_numbers((Vector2){text_area_border.x +5 , text_area_border.y+5});
 	
	DrawRectangleLinesEx(text_area_border, border_thickness, color);
	DrawText(txt, pos.x, pos.y, FONT_SIZE, color);
}

int line_count(char* str){
	char* tmp = str;
	int i = 0;
	
	if(strlen(str) == 0){
		return 0;
	}

	while( (tmp = strstr(tmp, "\n") + 1) != NULL ){
		i++;
	}

	return i;
}

int main(){

	char* src_file = "main.c";
	char* asm_file = "main.c.s";

	MapSrc* ms = prepare_src_asm_mapping(asm_file, src_file);
	MapSrc* tmp_ms = ms;

	InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, TITLE_TEXT);
	ClearBackground(BLACK);
	
	Camera2D camera =  { 0 };
	camera.target = (Vector2) {SCREEN_WIDTH, SCREEN_HEIGHT};
	camera.offset = (Vector2) {SCREEN_WIDTH, SCREEN_HEIGHT};
	camera.rotation = 0.0f;
	camera.zoom = 1.0f;

	while(!WindowShouldClose()){
		BeginDrawing();
		ClearBackground(BLACK);
		int i = 0;
		int j = 0;
		float asm_block_pos = 5, drift = 0.0;
		float src_line_pos = 5;
	
		Vector2 text_scroll_offset = { 0 };

		if (IsKeyDown(KEY_UP)) text_scroll_offset.y -= 5.0;
		else if (IsKeyDown(KEY_DOWN)) text_scroll_offset.y += 5.0;

		camera.target = (Vector2){
			camera.target.x + text_scroll_offset.x,
			camera.target.y + text_scroll_offset.y
		};
	
		BeginMode2D(camera);
		while(tmp_ms != NULL){
			src_line_pos = i*(FONT_SIZE + 5);

			text_area(
				(Vector2){0,src_line_pos},
				(Vector2){SCREEN_HEIGHT, SCREEN_WIDTH/2},
				tmp_ms->color,
				0.0,
				tmp_ms->src_line
			);	
			
			if(tmp_ms->parent != NULL){
				asm_block_pos += ((FONT_SIZE + 5) * tmp_ms->parent->asm_line_count) + 5;
			}

			text_area(
				(Vector2){SCREEN_WIDTH/2, asm_block_pos},
				(Vector2){SCREEN_HEIGHT, SCREEN_WIDTH},
				tmp_ms->color,
				0.0,
				tmp_ms->asm_block
			);	
		
			i++;
			j++;	
			tmp_ms = tmp_ms->child;
		}
		EndMode2D();

		free(tmp_ms);
		tmp_ms = ms;
		
		DrawLineV(
			(Vector2){ SCREEN_WIDTH/2, 0 },
			(Vector2){ SCREEN_WIDTH/2, SCREEN_HEIGHT },
			WHITE
		);
		EndDrawing();
	}

	return 0;
 
}
