int square(int num) {
	return num * num;
}

void test(int a, int b, int c){
	int tmp1 = a;
	int tmp2 = c;
	a = c;
	c = tmp1;
	b = b * b;
}

void main(){}
