/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_memmove.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: arabelo- <arabelo-@student.42lisboa.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/04/12 15:36:14 by arabelo-          #+#    #+#             */
/*   Updated: 2023/07/03 13:19:37 by arabelo-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../inc/libft.h"

void	*ft_memmove(void *dest, const void *src, size_t n)
{
	int				i;
	unsigned char	*dest_uc;
	unsigned char	*src_uc;

	dest_uc = (unsigned char *)dest;
	src_uc = (unsigned char *)src;
	i = n - 1;
	if (src < dest)
	{
		while (i >= 0)
		{
			dest_uc[i] = src_uc[i];
			i--;
		}
	}
	else
		ft_memcpy(dest, src, n);
	return (dest);
}
