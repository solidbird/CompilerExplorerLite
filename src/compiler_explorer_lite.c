#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "resources.h"
#include <raylib.h>


/*while line_obj, line_src:
	if strcmp(line_obj, line_src):
		
	
		build_obj += line_obj
		continue

	MapColor mapc = {
		.obj = build_obj,
		.src = line_src,
		.color = RED
	};
*/	

typedef struct {
	char* src;
	char* obj;
	Color color;
} MapColor;

typedef struct MapSrc {
	struct MapSrc* parent;
	struct MapSrc* child;
	
	char* filename;
	char* src_line;
	int line_count;
	Color color;
	char* asm_block;
} MapSrc;

long last_position = 0L;

char* remove_spaces(const char* s){
	char* d = s;
	char* tmp = (char*) malloc(strlen(d)+1);
	strcpy(tmp, d);
	int i = -1;
	
	do{
		while (*d == ' ' || *d == '\t') {
			d++;
		}
		i++;
	}while(tmp[i] = *d++);
	return tmp; 
}

MapSrc* prepare_src_list(char* src_file){
	FILE *src_fp;
	char *src_line = NULL;
	size_t src_len = 0;
	ssize_t src_read;

	src_fp = fopen(src_file, "r");

	MapSrc* src_line_mapping = (MapSrc*) malloc(sizeof(MapSrc));
	src_read = getline(&src_line, &src_len, src_fp);
	
	*src_line_mapping = (MapSrc){
		.parent = NULL,
		.child = NULL,
		.filename = src_file,
		.src_line = src_line,
		.line_count = 1,
		.color = RED,
		.asm_block = NULL
	};

	while ((src_read = getline(&src_line, &src_len, src_fp)) != -1) {
		MapSrc* src_node = (MapSrc*) malloc(sizeof(MapSrc));

		src_node->parent = src_line_mapping;
		src_node->child = NULL;
		src_node->filename = src_file;
		src_node->src_line = src_node->parent->src_line + 1;
		src_node->line_count = src_file;
		src_node->color = RED;
		src_node->asm_block = NULL;

		src_node->parent->child = src_node;
	}

	fclose(src_fp);

	return src_line_mapping;
}

char* create_buid_asm(char* src_file){
	const char *cmd_build_asm = "/bin/gcc";
	
	char asm_file[100], file_end[100];
	strcpy(asm_file, src_file);
	strcpy(file_end, ".s");
	strcat(asm_file, file_end);

	const char *args[] = {"gcc", "-S", "-fverbose-asm", src_file, "-o", asm_file, NULL};
	execv(cmd_build_asm, args);

	return asm_file;
}

void setup_line_numbers(Vector2 pos){
	int text_width_last = 0;
 	int text_width_current = 0;
	char* editor_lines = "0:";

	for(int i = FONT_SIZE; i <= SCREEN_HEIGHT; i+=FONT_SIZE){
		asprintf(&editor_lines, "%s\n%d:", editor_lines, i/FONT_SIZE);
	}
	DrawText(editor_lines, 0, 0, FONT_SIZE, WHITE);
}

void text_area(Vector2 pos, Vector2 size, Color color, float border_thickness, char filepath[]){
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

int main(){

	create_buid_asm("example/square.c");
	
	//MapColor *mpc = (MapColor*) malloc(sizeof(MapColor) * 1024);
	//scan_obj("example/square.c", "example/square.c.s", mpc);
	//printf("\n\nSOURCE: %s, OBJECT: %s\n\n", mpc[5].src, mpc[5].obj);	
	//free(mpc);
	MapSrc* ms = prepare_src_list("example/square.c");
	while(ms != NULL){
		printf("%s", ms->src_line);
		ms = ms->child;
	}
	return 0;

	InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, TITLE_TEXT);
	

	while(!WindowShouldClose()){
		BeginDrawing();

		DrawLineV(
			(Vector2){ SCREEN_WIDTH/2, 0 },
			(Vector2){ SCREEN_WIDTH/2, SCREEN_HEIGHT },
			WHITE
		);

	
		text_area((Vector2){20, 0}, (Vector2){SCREEN_WIDTH/2 -20, SCREEN_HEIGHT}, BLUE, 0.0f, "example/square.c");
		text_area((Vector2){SCREEN_WIDTH/2, 0}, (Vector2){SCREEN_WIDTH, SCREEN_HEIGHT}, BLUE, 0.0f, "example/square.c.s");

		EndDrawing();
	}
	
	return 0;
}
