typedef struct MapSrc {
	struct MapSrc* parent;
	struct MapSrc* child;

	char* filename;
	char* src_line;
	int line_count;
	Color color;
	char asm_block[2048];
	int asm_line_count;
} MapSrc;

int add_node(MapSrc* root, MapSrc node);
int del_node(MapSrc* root);

