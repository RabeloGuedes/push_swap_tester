/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strlcpy.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: arabelo- <arabelo-@student.42lisboa.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/04/08 21:55:46 by arabelo-          #+#    #+#             */
/*   Updated: 2023/07/03 13:19:37 by arabelo-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../inc/libft.h"

size_t	ft_strlcpy(char *dest, const char *src, size_t size)
{
	size_t	src_len;
	size_t	copy_len;

	src_len = ft_strlen(src);
	copy_len = 0;
	if (size == 0)
		return (src_len);
	if (size > 0)
		copy_len = size - 1;
	if (src_len < copy_len)
		copy_len = src_len;
	ft_memcpy(dest, src, copy_len);
	dest[copy_len] = '\0';
	return (src_len);
}
