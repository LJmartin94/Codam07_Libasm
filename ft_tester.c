#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <errno.h>
#include <fcntl.h>
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

int ft_test_read(int argc, char **argv)
{
	int fd;
	void *buf;
	int len;
	int ret;

	if (argc != 4)
		return (0);
	fd = atoi(argv[1]);
	if (fd >= 42)
		fd = open("./WRfile.txt", O_RDWR);
	errno = 0;
	buf = (char *)malloc(1000 * (sizeof(char)));
	len = atoi(argv[3]);
	ret = ft_read(fd, buf, len);
	printf("Read: |%s|, ret: %d\n", (char *)buf, ret);
	if (errno != 0)
		printf("An error occurred, errno = %d\n", errno);
	return (ret);
}

int ft_test_strdup(int argc, char **argv)
{
	char *str1;
	char *str2;
	char *str3;

	if (argc != 2)
		return (0);
	str1 = argv[1];
	str3 = (char *)malloc(1000 * (sizeof(char)));
	ft_strcpy(str3, str1);
	str2 = ft_strdup(str1);
	str1 = "a";
	printf("Strdup: |%s|\n", str2);
	return (0);
}

int main(int argc, char **argv)
{
	argc--;
	if (ft_strlen(argv[1]) < 4)
		ft_write(1, "Please specify the function to test in first arg: \
	strlen, strcpy, strcmp, write, read, strdup", 94);
	else if (argv[1][3] == 'l' || 0)
		ft_test_strlen(argc, &(argv[1]));
	else if (argv[1][4] == 'p' || 0)
		ft_test_strcpy(argc, &(argv[1]));
	else if (argv[1][4] == 'm' || 0)
		ft_test_strcmp(argc, &(argv[1]));
	else if (argv[1][0] == 'w' || 0)
		ft_test_write(argc, &(argv[1]));
	else if (argv[1][0] == 'r' || 0)
		ft_test_read(argc, &(argv[1]));
	else if (argv[1][3] == 'd' || 0)
		ft_test_strdup(argc, &(argv[1]));
	else
		ft_write(1, "Please specify the function to test in first arg: \
	strlen, strcpy, strcmp, write, read, strdup", 94);
	return (0);
}