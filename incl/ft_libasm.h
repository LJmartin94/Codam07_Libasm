#ifndef FT_LIBASM_H
# define FT_LIBASM_H

# include <errno.h>
# include <sys/types.h>

unsigned long	ft_strlen(char *str);
char			*ft_strcpy(char *dst, char *src);
int				ft_strcmp(char *s1, char *s2);
ssize_t			ft_write(int fd, char *buff, size_t count);
ssize_t			ft_read(int fd, char *buff, size_t count);
char			*ft_strdup(const char *str);

#endif