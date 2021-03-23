#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <string.h>
//int compare(int64_t a, int64_t b);
#include "ft_libasm.h"

int ft_test_strcpy(int argc, char **argv)
{
	char *src;
	char *dest;

	if (argc != 2)
		return (0);
	src = argv[1];
	dest = (char *)malloc(sizeof(char) * (strlen(argv[1]) + 1));
	ft_strcpy(dest, src);
	src[0] = '\0';
	argv[1][0] = '\0';
	printf("%s\n", dest);
	return (0);
}

int ft_test_strlen(int argc, char **argv)
{
	if (argc != 2)
		return (0);
	printf("%lu\n",ft_strlen(argv[1]));
	return (0);
}

int ft_test_compare(int argc, char **argv)
{
	int a;
	int b;

	if (argc != 3)
		return (0);
	a = atoi(argv[1]);
	b = atoi(argv[2]);
	//printf("%d\n", compare(a, b));
	return (0);
}

int main(int argc, char **argv)
{
	if (0)
		ft_test_compare(argc, argv);
	if (0)
		ft_test_strlen(argc, argv);
	if (1)
		ft_test_strcpy(argc, argv);
	return (0);
}