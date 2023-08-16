/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: arabelo- <arabelo-@student.42lisboa.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/04/26 13:54:34 by arabelo-          #+#    #+#             */
/*   Updated: 2023/07/24 14:56:00 by arabelo-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../inc/get_next_line.h"

char	*get_next_line(int fd)
{
	static char	*buffer;
	char		*line;

	if (fd < 0 || BUFFER_SIZE < 1)
		return (NULL);
	buffer = update_buffer(buffer, fd);
	if (!buffer)
		return (NULL);
	line = get_one_line(buffer);
	buffer = update_new_buffer(buffer);
	return (line);
}

char	*update_buffer(char *buffer, int fd)
{
	int		r_status;
	char	*temp;

	r_status = 1;
	temp = (char *)malloc(sizeof(char) * BUFFER_SIZE + 1);
	if (!temp)
		return (NULL);
	while (!ft_strchr(buffer, '\n') && r_status)
	{
		r_status = read(fd, temp, BUFFER_SIZE);
		if (r_status == -1)
		{
			free(temp);
			free(buffer);
			return (NULL);
		}
		temp[r_status] = '\0';
		buffer = ft_strjoin(buffer, temp);
	}
	free(temp);
	return (buffer);
}

char	*get_one_line(char *buffer)
{
	int		i;
	char	*line;

	i = 0;
	if (!ft_strlen(buffer))
		return (NULL);
	while (buffer[i] && buffer[i] != '\n')
		i++;
	if (buffer[i] == '\n')
		i++;
	line = (char *)malloc(sizeof(char) * i + 1);
	if (!line)
		return (NULL);
	line[i] = '\0';
	while (i--)
		line[i] = buffer[i];
	return (line);
}

char	*update_new_buffer(char *buffer)
{
	char	*new_buffer;
	int		i;
	int		j;

	i = 0;
	if (!buffer)
		return (NULL);
	while (buffer[i] && buffer[i] != '\n')
		i++;
	if (buffer[i] == '\n')
		i++;
	if (!buffer[i])
	{
		free(buffer);
		return (NULL);
	}
	new_buffer = (char *)malloc(sizeof(char) * (ft_strlen(buffer) - i) + 1);
	if (!new_buffer)
		return (NULL);
	j = 0;
	while (buffer[i])
		new_buffer[j++] = buffer[i++];
	new_buffer[j] = '\0';
	free(buffer);
	return (new_buffer);
}
