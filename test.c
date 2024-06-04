int test(int a, int b){
	if(a < b){
		test(a, b-1);
	}else{
		return a;
	}
	return b;
}


int square(int sq){
	return sq * sq;
}


int main(){
	while(test(4, 6)){
		square(5);
	}

	return 0;
}
