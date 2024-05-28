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

/*
TODO: Try to set fseek for the last possition of obj_line that way
we dont go all the way back to the start but we stay in the context of the current thing (function, while, for, etc.)
otherwise the brackets are making everything weird and break
*/
MapColor get_obj_block(char* obj_file, char* line, char* next_line){
	FILE *obj_fp;
	char *obj_line = NULL;
	size_t obj_len = 0;
	ssize_t obj_read;

	char obj_build[1024];
	obj_build[0] = '\0';

	obj_fp = fopen(obj_file, "r");
	
	char* obj_line_clean;
	char* line_clean = remove_spaces(line);
	char* next_line_clean = remove_spaces(next_line);
	
	fseek(obj_fp, last_position, SEEK_SET);

	while ((obj_read = getline(&obj_line, &obj_len, obj_fp)) != -1) {
		obj_line_clean = remove_spaces(obj_line);
		if (strstr(obj_line_clean, line_clean) == NULL){ 
			continue;
		}
			
		//printf("BLOCK: %s", line);
		printf("SRC: %s, OBJ: %s\n", line, obj_line);

		if(strlen(next_line) == 0){
			while ((obj_read = getline(&obj_line, &obj_len, obj_fp)) != -1){
				strcat(obj_build, obj_line);
				if(obj_line[0] == '\n'){
					printf("BLOCK: %s\n", obj_build);
					MapColor mpc = {
						.src = next_line,
						.obj = obj_build,
						.color = RED
					};

					last_position = ftell(obj_fp);
					obj_build[0] = '\0';
					fclose(obj_fp);
					return mpc;
				} 
			}
		}

		last_position = ftell(obj_fp);
		while ((obj_read = getline(&obj_line, &obj_len, obj_fp)) != -1){
			obj_line_clean = remove_spaces(obj_line);
	
			if (strstr(obj_line_clean, next_line_clean) != NULL){
				printf("BLOCK: %s\n", obj_build);
				MapColor mpc = {
					.src = next_line,
					.obj = obj_build,
					.color = RED
				};

				obj_build[0] = '\0';
				fclose(obj_fp);
				return mpc;
			}else{
				strcat(obj_build, obj_line);
			}
			
		}
	}

	fclose(obj_fp);
}

void scan_obj(char* src_file, char* obj_file, MapColor *block){
	FILE *src_fp;
	char *src_line = NULL;
	size_t src_len = 0;
	ssize_t src_read;

	src_fp = fopen(src_file, "r");

	size_t i = 0;
	long pos = NULL;

	while ((src_read = getline(&src_line, &src_len, src_fp)) != -1) {
		if (src_line[0] == '\n'){ continue; }

		char* line = src_line;
		char* next_line = NULL;
		fflush(src_fp);
		pos = ftell(src_fp);

		getline(&next_line, &src_len, src_fp);
		fseek(src_fp, pos, SEEK_SET);
		
		block[i] = get_obj_block(obj_file, line, next_line);
		i++;
	}

	fclose(src_fp);
}

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
	
	MapColor *mpc = (MapColor*) malloc(sizeof(MapColor) * 1024);
	scan_obj("example/square.c", "example/square.c.s", mpc);
	printf("\n\nSOURCE: %s, OBJECT: %s\n\n", mpc[5].src, mpc[5].obj);	
	free(mpc);
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
