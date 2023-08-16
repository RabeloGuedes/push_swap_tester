/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_substr.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: arabelo- <arabelo-@student.42lisboa.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/04/14 11:54:45 by arabelo-          #+#    #+#             */
/*   Updated: 2023/07/03 13:19:37 by arabelo-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../inc/libft.h"

char	*ft_substr(char const *s, unsigned int start, size_t len)
{
	char	*ptr;
	size_t	rest_len;
	size_t	i;

	i = 0;
	if (ft_strlen(s) <= start)
		rest_len = 1;
	else if (len > ft_strlen(s) - start)
		rest_len = ft_strlen(s) - start + 1;
	else
		rest_len = len + 1;
	ptr = (char *)malloc(sizeof(char) * rest_len);
	if (!ptr)
		return (ptr);
	while (start < ft_strlen(s) && len--)
		ptr[i++] = s[start++];
	ptr[i] = '\0';
	return (ptr);
}
