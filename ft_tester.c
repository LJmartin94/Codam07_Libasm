#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
int compare(int64_t a, int64_t b);

int ft_test_compare(int argc, char **argv)
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

int ft_test_strlen(int argc, char **argv)
{
	if (argc != 2)
		return (0);
	printf("%d",ft_strlen(argv[1]));
	return (0);
}

int main(int argc, char **argv)
{
	if (0)
		ft_test_compare(argc, argv);
	if (1)
		ft_test_strlen(argc, argv);
	return (0);
}