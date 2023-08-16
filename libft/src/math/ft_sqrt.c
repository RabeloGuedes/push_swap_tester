/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_sqrt.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: arabelo- <arabelo-@student.42lisboa.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/08/05 09:03:56 by arabelo-          #+#    #+#             */
/*   Updated: 2023/08/07 22:09:30 by arabelo-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../inc/libft.h"

int	ft_sqrt(int nb)
{
	int	sqrt;

	if (nb <= 0)
		return (0);
	if (nb == 1)
		return (1);
	sqrt = 1;
	while (sqrt < nb / sqrt)
		sqrt++;
	if (sqrt == nb / sqrt && nb % sqrt == 0)
		return (sqrt);
	return (0);
}
