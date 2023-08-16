/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atoi_base.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: arabelo- <arabelo-@student.42lisboa.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/08/04 23:28:55 by arabelo-          #+#    #+#             */
/*   Updated: 2023/08/05 00:51:29 by arabelo-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../inc/libft.h"

int	check_duplicate(char *base)
{
	char	*copy;

	while (*base)
	{
		copy = base + 1;
		if (*base == '+' || *base == '-' || ft_isspace(*base))
			return (0);
		while (*copy)
		{
			if (*base == *copy)
				return (0);
			copy++;
		}
		base++;
	}
	return (1);
}

int	ft_is_char_valid(char c, char *base)
{
	while (*base)
	{
		if (c == *base)
			return (1);
		base++;
	}
	return (0);
}

int	get_base_index(char c, char *base)
{
	int	i;

	i = 0;
	while (base[i])
	{
		if (c == base[i])
			return (i);
		i++;
	}
	return (-1);
}

int	ft_atoi_base(char *str, char *base)
{
	int			sign;
	long long	res;

	sign = 1;
	res = 0;
	if (ft_strlen(base) <= 1 || !check_duplicate(base))
		return (0);
	while (ft_isspace(*str))
		str++;
	if (*str == '+' || *str == '-')
		if (*str++ == '-')
			sign = -1;
	while (*str && ft_is_char_valid(*str, base))
		res = res * ft_strlen(base) + get_base_index(*str++, base);
	return (sign * res);
}
