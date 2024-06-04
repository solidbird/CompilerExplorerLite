#include <stdlib.h>
#include <stddef.h>
#include <string.h>
#include <raylib.h>

#include "map_src_list.h"

int add_node(MapSrc *root, MapSrc node){
	MapSrc *tmp_root = root;

	while(tmp_root->child != NULL){
		tmp_root = tmp_root->child;
	}

	MapSrc* new_node = (MapSrc*) malloc(sizeof(MapSrc));
	memcpy(new_node, &node, sizeof(MapSrc));

	tmp_root->child = new_node;
	new_node->parent = tmp_root;

	return new_node->line_count;
}

