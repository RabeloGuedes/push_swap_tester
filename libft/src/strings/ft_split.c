/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_split.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: arabelo- <arabelo-@student.42lisboa.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/04/15 13:17:21 by arabelo-          #+#    #+#             */
/*   Updated: 2023/07/03 13:19:37 by arabelo-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../inc/libft.h"

static size_t	ft_word_counter(char const *s, char c)
{
	size_t	words_counter;

	words_counter = 0;
	while (*s)
	{
		while (*s == c)
			s++;
		if (*s)
			words_counter++;
		while (*s != c && *s)
			s++;
	}
	return (words_counter + 1);
}

static char	*ft_copy(char const *s, char **list, char c)
{
	size_t	i;

	i = 0;
	while (s[i] != c && s[i])
		i++;
	*list = ft_substr(s, 0, i);
	return ((char *)s + i);
}

char	**ft_split(char const *s, char c)
{
	char	**list;
	char	**buffer;

	if (!s)
		return (NULL);
	list = (char **)malloc(sizeof(*list) * ft_word_counter(s, c));
	if (!list)
		return (NULL);
	buffer = list;
	while (*s)
	{
		while (*s == c)
			s++;
		if (*s)
			s = ft_copy(s, list++, c);
	}
	*list = 0;
	return (buffer);
}
