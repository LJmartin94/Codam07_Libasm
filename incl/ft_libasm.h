#ifndef LIBASM_H
# define LIBASM_H

unsigned long	ft_strlen(char *str);
char			*ft_strcpy(char *dst, char *src);
int				ft_strcmp(char *s1, char *s2);
ssize_t			ft_write(int fd, char *buff, size_t count);
ssize_t			ft_read(int fd, char *buff, size_t count);
char			*ft_strdup(const char *str);
int				compare(int64_t a, int64_t b); //this needs to be removed before handing in

#endif