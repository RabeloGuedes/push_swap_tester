/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putnbr_base.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: arabelo- <arabelo-@student.42lisboa.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/08/04 23:31:22 by arabelo-          #+#    #+#             */
/*   Updated: 2023/08/05 00:51:07 by arabelo-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../inc/libft.h"

int	check_duplicate(char *base)
{
	char	*copy;

	while (*base)
	{
		copy = base + 1;
		if (*base == '+' || *base == '-')
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

void	ft_putbase(unsigned long nbr, char *base)
{
	if (nbr > ft_strlen(base) - 1)
	{
		ft_putbase(nbr / ft_strlen(base), base);
		ft_putbase(nbr % ft_strlen(base), base);
	}
	else
		ft_putchar_fd(base[nbr % ft_strlen(base)], 1);
}

void	ft_putnbr_base(int nbr, char *base)
{
	if (ft_strlen(base) <= 1 || !check_duplicate(base))
		return ;
	if (nbr < 0)
	{
		ft_putchar_fd('-', 1);
		ft_putbase(-nbr, base);
	}
	else
		ft_putbase(nbr, base);
}
