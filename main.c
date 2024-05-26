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

void remove_spaces(char* s){
	char* d = s;
	do {
		while (*d == ' ') {
			++d;
		}
	} while(*s++ = *d++);
}

MapColor get_obj_block(char* obj_file, char* line, char* next_line){
	FILE *obj_fp;
	char *obj_line = NULL;
	size_t obj_len = 0;
	ssize_t obj_read;

	char obj_build[1024];
	obj_build[0] = '\0';

	obj_fp = fopen(obj_file, "r");

	while ((obj_read = getline(&obj_line, &obj_len, obj_fp)) != -1) {
		if (strstr(obj_line, line) == NULL){ 
			continue;
		}
			
		printf("SRC: %s, OBJ: %s\n", line, obj_line);
		while ((obj_read = getline(&obj_line, &obj_len, obj_fp)) != -1){
			if (strstr(obj_line, next_line) != NULL){
				printf("BLOCK: %s\n", obj_build);
				MapColor mpc = {
					.src = line,
					.obj = obj_build,
					.color = RED
				};

				obj_build[0] = '\0';
				fclose(obj_fp);
				return mpc;
			}
			strcat(obj_build, obj_line);
		}
	}

	fclose(obj_fp);
}

MapColor* scan_obj(char* src_file, char* obj_file){
	FILE *src_fp;
	char *src_line = NULL;
	size_t src_len = 0;
	ssize_t src_read;

	src_fp = fopen(src_file, "r");
	MapColor mpc[1024];	

	size_t i = 0;

	while ((src_read = getline(&src_line, &src_len, src_fp)) != -1) {
		FILE *tmp = src_fp;	
	
		char* line = src_line;
		char* next_line = NULL;
		getline(&next_line, &src_len, tmp);

		mpc[i++] = get_obj_block(obj_file, line, next_line);
	}

	fclose(src_fp);
	return mpc;
}

//TODO: DOESNT WORK WITH OBJDUMP YET
char* create_buid_objdump(char* src_file){
	const char *cmd_build = "/bin/gcc";
	
	char bin_file[100], file_end[100];
	strcpy(bin_file, src_file);
	strcpy(file_end, ".bin");
	strcat(bin_file, file_end);

	const char *args_build[] = {"gcc", "-g", src_file, "-o", bin_file, NULL};
	
	const char *cmd_obj = "bin/objdump";
	const char *args_obj[] = {"objdump", "-S", bin_file, "-M", "intel", ">", "test.txt", NULL};

	execv(cmd_build, args_build);
	execv(cmd_obj, args_obj);

	return bin_file;
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

	//create_buid_objdump("example/square.c");
	MapColor *mpc;
	mpc = scan_obj("example/square.c", "example/square.c.s");
	printf("SRC: %s\nOBJ: %s\nCOLOR: %s\n", mpc[0].src, mpc[0].obj, mpc[0].color);
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
