/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_str_capitalizer.c                               :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: arabelo- <arabelo-@student.42lisboa.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/08/04 19:03:01 by arabelo-          #+#    #+#             */
/*   Updated: 2023/08/04 19:58:46 by arabelo-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../inc/libft.h"

void	ft_str_capitalizer(char *str)
{
	char	*begin;

	begin = str;
	while (*str)
	{
		if (ft_isalpha(*str))
		{
			if (ft_islower(*str) && (begin == str || !ft_isalnum(*(str - 1))))
				*str = ft_toupper(*str);
			else if (ft_isupper(*str) && ft_isalnum(*(str - 1)))
				*str = ft_tolower(*str);
		}
		str++;
	}
}
