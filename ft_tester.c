#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
int compare(int64_t a, int64_t b);

int main(int argc, char **argv)
{
	int a;
	int b;

	if (argc != 3)
		return (0);
	a = atoi(argv[1]);
	b = atoi(argv[2]);
	printf("%d", compare(a, b));
	return (0);
}