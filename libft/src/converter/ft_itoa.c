/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_itoa.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: arabelo- <arabelo-@student.42lisboa.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/04/15 18:07:28 by arabelo-          #+#    #+#             */
/*   Updated: 2023/07/03 13:19:37 by arabelo-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../inc/libft.h"

static size_t	ft_nbr_len(int n)
{
	size_t	len;

	len = 0;
	if (!n)
		return (1);
	else if (n < 0)
		len++;
	while (n)
	{
		len++;
		n /= 10;
	}
	return (len);
}

static void	ft_build_chr(int n, size_t len, char *ptr)
{
	if (n < 0)
	{
		ptr[len] = '\0';
		while (n)
		{
			ptr[--len] = ((n % 10) * -1) + 48;
			n /= 10;
		}
		ptr[--len] = '-';
	}
	else
	{
		ptr[len] = '\0';
		while (n)
		{
			ptr[--len] = (n % 10) + 48;
			n /= 10;
		}
	}
}

char	*ft_itoa(int n)
{
	char	*ptr;
	size_t	len;

	len = ft_nbr_len(n);
	ptr = (char *)malloc(sizeof(*ptr) * len + 1);
	if (!ptr)
		return (ptr);
	if (n)
		ft_build_chr(n, len, ptr);
	else
	{
		ptr[len--] = '\0';
		ptr[len] = '0';
	}
	return (ptr);
}
