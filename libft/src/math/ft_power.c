/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_power.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: arabelo- <arabelo-@student.42lisboa.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/08/05 08:42:49 by arabelo-          #+#    #+#             */
/*   Updated: 2023/08/05 08:57:24 by arabelo-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../inc/libft.h"

int	ft_power(int nb, int power)
{
	int	res;

	res = 1;
	if (power < 0)
		return (0);
	if (!nb && !power)
		return (1);
	while (power--)
		res *= nb;
	return (res);
}