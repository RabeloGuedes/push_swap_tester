/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_memcmp.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: arabelo- <arabelo-@student.42lisboa.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/04/13 16:37:47 by arabelo-          #+#    #+#             */
/*   Updated: 2023/07/03 13:19:37 by arabelo-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../inc/libft.h"

int	ft_memcmp(const void *s1, const void *s2, size_t n)
{
	unsigned char	*t;
	unsigned char	*u;

	if (!n)
		return (0);
	t = (unsigned char *)s1;
	u = (unsigned char *)s2;
	while (n--)
	{
		if (*t != *u)
			return (*t - *u);
		t++;
		u++;
	}
	return (0);
}
