#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <errno.h>
#include <fcntl.h>
//int compare(int64_t a, int64_t b);
#include "ft_libasm.h"

int ft_test_strcmp(int argc, char **argv)
{
	char *s1;
	char *s2;
	int ret;

	if (argc != 3)
		return (0);
	s1 = argv[1];
	s2 = argv[2];
	ret = ft_strcmp(s1, s2);
	printf("%d\n", ret);
	return (0);
}

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

int ft_test_write(int argc, char **argv)
{
	int fd;
	char *buf;
	int len;
	int ret;

	if (argc != 4)
		return (0);
	fd = atoi(argv[1]);
	if (fd >= 42)
		fd = open("./WRfile.txt", O_RDWR | O_CREAT | O_TRUNC);
	errno = 0;
	buf = argv[2];
	len = atoi(argv[3]);
	ret = ft_write(fd, buf, len);
	if (errno != 0)
		printf("An error occurred, errno = %d\n", errno);
	printf("\nReturn value from write: %d\n", ret);
	return (ret);
}

int main(int argc, char **argv)
{
	if (0)
		ft_test_compare(argc, argv);
	if (0)
		ft_test_strlen(argc, argv);
	if (0)
		ft_test_strcpy(argc, argv);
	if (0)
		ft_test_strcmp(argc, argv);
	if (1)
		ft_test_write(argc, argv);
	return (0);
}