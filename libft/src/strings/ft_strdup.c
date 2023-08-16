/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strdup.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: arabelo- <arabelo-@student.42lisboa.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/04/11 19:59:39 by arabelo-          #+#    #+#             */
/*   Updated: 2023/07/03 13:19:37 by arabelo-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../inc/libft.h"

char	*ft_strdup(const char *str)
{
	char	*copy;
	size_t	str_len;

	str_len = ft_strlen(str);
	copy = (char *)malloc(sizeof(*str) * str_len + 1);
	if (!copy)
		return (NULL);
	while (*str)
		*copy++ = *str++;
	*copy = '\0';
	return (copy - str_len);
}
