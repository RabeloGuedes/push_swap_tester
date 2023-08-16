/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strlcat.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: arabelo- <arabelo-@student.42lisboa.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/04/09 16:58:15 by arabelo-          #+#    #+#             */
/*   Updated: 2023/07/03 13:19:37 by arabelo-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../inc/libft.h"

size_t	ft_strlcat(char *dest, const char *src, size_t size)
{
	size_t	dest_len;
	size_t	src_len;

	src_len = ft_strlen(src);
	if (!size)
		return (size + src_len);
	dest_len = ft_strlen(dest);
	if (size <= dest_len)
		return (size + src_len);
	dest += dest_len;
	while (*src && size-- > dest_len + 1)
		*dest++ = *src++;
	*dest = '\0';
	return (dest_len + src_len);
}
