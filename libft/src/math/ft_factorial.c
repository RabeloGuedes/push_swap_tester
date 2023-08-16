/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_factorial.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: arabelo- <arabelo-@student.42lisboa.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/08/05 08:22:35 by arabelo-          #+#    #+#             */
/*   Updated: 2023/08/05 08:39:23 by arabelo-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../inc/libft.h"

int	ft_factorial(int nb)
{
	int	res;

	res = 1;
	if (nb < 0)
		return (0);
	if (!nb)
		return (1);
	while (nb)
		res = res * nb--;
	return (res);
}
