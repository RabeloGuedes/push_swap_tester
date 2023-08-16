/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_print_uint.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: arabelo- <arabelo-@student.42lisboa.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/05/15 21:00:11 by arabelo-          #+#    #+#             */
/*   Updated: 2023/06/29 11:49:42 by arabelo-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../inc/ft_printf.h"

u_int16_t	uint_len(u_int32_t nbr)
{
	u_int16_t	len;

	if (nbr == 0)
		return (1);
	len = 0;
	while (nbr)
	{
		nbr /= 10;
		len++;
	}
	return (len);
}

char	*ft_uitoa(u_int32_t nbr)
{
	char		*ui;
	u_int16_t	len;

	len = uint_len(nbr);
	ui = (char *)malloc(sizeof(char) * len + 1);
	if (!ui)
		return (NULL);
	ui[len--] = '\0';
	if (nbr == 0)
		ui[len] = '0';
	while (nbr)
	{
		ui[len--] = nbr % 10 + 48;
		nbr /= 10;
	}
	return (ui);
}

u_int16_t	ft_print_uint(u_int32_t nbr)
{
	u_int16_t	len;
	char		*ui;

	len = 0;
	ui = ft_uitoa(nbr);
	len = ft_print_str(ui);
	free(ui);
	return (len);
}
