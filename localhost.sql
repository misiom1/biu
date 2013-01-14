-- phpMyAdmin SQL Dump
-- version 3.5.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Czas wygenerowania: 14 Sty 2013, 18:09
-- Wersja serwera: 5.5.21-log
-- Wersja PHP: 5.4.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Baza danych: `misio_projekt`
--
CREATE DATABASE `misio_projekt` DEFAULT CHARACTER SET latin2 COLLATE latin2_general_ci;
USE `misio_projekt`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `codes`
--

CREATE TABLE IF NOT EXISTS `codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `code` longtext NOT NULL,
  `jezyk` varchar(30) NOT NULL,
  `nazwa` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin2 AUTO_INCREMENT=20 ;

--
-- Zrzut danych tabeli `codes`
--

INSERT INTO `codes` (`id`, `id_user`, `code`, `jezyk`, `nazwa`) VALUES
(1, 1, '#include <stdio.h>\n#include <stdlib.h>\n#include <string.h>\nint main()\n{\n    int i,x, sumap = 0, suman = 0;\n	char tab[255];\n    scanf("%s", tab);\n	for(i = 0; i < 255; i++) {\n		if(tab[i] == ''\\0'') break;\n	}\n	//printf("\\n%d", i);\n	for(x = 0; x < i; x++) {\n		if(x % 2 == 0) {\n			//printf("\\nParzysta: %d",  tab[x] - ''0'');\n			sumap += tab[x] - ''0'';\n		} else {\n			//printf("\\nNieparzysta: %d", tab[x] - ''0'');\n			suman += tab[x] - ''0'';\n			//printf("\\nsuman: %d", suman);\n		}\n	}\n	//printf("\\nSuma parzysta: %d", sumap);\n	//printf("\\nSuma nieparzysta: %d", suman);\n	if((sumap - suman)% 11 == 0) printf("\\nLiczba podzielna przed 11");\n	else printf("\\nLiczba niepodzielna przez 11");\n    return 0;\n}\n', 'C, C++, Java', ''),
(5, 4, '#include <stdio.h>\n#include <stdlib.h>\n#include <string.h>\nint main()\n{\n    int i,x, sumap = 0, suman = 0;\n	char tab[255];\n    scanf("%s", tab);\n	for(i = 0; i < 255; i++) {\n		if(tab[i] == ''\\0'') break;\n	}\n	//printf("\\n%d", i);\n	for(x = 0; x < i; x++) {\n		if(x % 2 == 0) {\n			//printf("\\nParzysta: %d",  tab[x] - ''0'');\n			sumap += tab[x] - ''0'';\n		} else {\n			//printf("\\nNieparzysta: %d", tab[x] - ''0'');\n			suman += tab[x] - ''0'';\n			//printf("\\nsuman: %d", suman);\n		}\n	}\n	//printf("\\nSuma parzysta: %d", sumap);\n	//printf("\\nSuma nieparzysta: %d", suman);\n	if((sumap - suman)% 11 == 0) printf("\\nLiczba podzielna przed 11");\n	else printf("\\nLiczba niepodzielna przez 11");\n    return 0;\n}\n', 'clike', 'tescik :)'),
(8, 6, '#include<stdio.h>\nint main() {\n  printf("HELLO WORLD");\n}\n', 'clike', 'hello world'),
(18, 8, '#include <stdio.h>\n#include <stdlib.h>\n\nstruct btree\n{\n    int leaf;\n    int n; // ilosc kluczy\n    int key[6]; // na wszelki wypadek +1\n    struct btree *root;\n    struct btree *c[7];\n};\nvoid BtreeSearch(struct btree *x, int k, int first, int *search);\nvoid BtreeCreate(struct btree *T);\nvoid BtreeSplitChild(struct btree *x, int i, struct btree *y);\nvoid BtreeInsert(struct btree *T, int k, int *used);\nvoid BtreeInsertNonFull(struct btree *x, int k, int *used);\nvoid Print(struct btree *T, int first);\n\nint main()\n{\n    int first;\n    int search[2];\n    int used[1];\n    int number;\n    char input;\n    struct btree *start;\n    start=(struct btree *)malloc(sizeof(struct btree));\n    BtreeCreate(start);\n    used[0]=0;\n    while(scanf("%c", &input)!=EOF)\n    {\n        if(input==''W'')\n        {\n            if(used[0]!=0)\n            {\n                first=1;\n                Print(start, first);\n                printf("\\n");\n            }\n            else\n            {\n                printf("( ) \\n");\n            }\n        }\n        if(input==''D'')\n        {\n            scanf("%d", &number);\n            if(used[0]!=0)\n            {\n                first=1;\n                search[0]=0;\n                BtreeSearch(start, number, first, search);\n            }\n            if(search[1]==0 || used[0]==0)\n            {\n                BtreeInsert(start, number, used);\n            }\n        }\n        if(input==''S'')\n        {\n            scanf("%d", &number);\n            if(used[0]!=0)\n            {\n                first=1;\n                search[0]=1;\n                BtreeSearch(start, number, first, search);\n            }\n            else\n            {\n                printf(":(\\n");\n            }\n        }\n    }\n    return 0;\n}\nvoid Print(struct btree *T, int first)\n{\n    struct btree *x;\n    if(first==1)\n    {\n        x=T->root;\n        first=0;\n    }\n    else\n    {\n        x=T;\n    }\n    if(x->leaf==1)\n    {\n        int i=1;\n        printf("( ");\n        for(i; i<=x->n; i++)\n        {\n            printf("%d ", x->key[i]);\n        }\n        printf(") ");\n    }\n    else\n    {\n        int j=1;\n        printf("( ");\n        for(j; j<=x->n; j++)\n        {\n            Print(x->c[j], first);\n            printf("%d ", x->key[j]);            \n        }\n        Print(x->c[x->n+1], first);\n        printf(") ");\n    }\n}\nvoid BtreeCreate(struct btree *T)\n{\n    struct btree *x;\n    x=(struct btree *)malloc(sizeof(struct btree));\n    x->leaf=1;\n    x->n=0;\n    T->root=x;\n}\nvoid BtreeSearch(struct btree *T, int k, int first, int *search)\n{\n    int i=1;\n    struct btree *NIL, *x;\n    NIL=(struct btree *)malloc(sizeof(struct btree));\n    if(first==1)\n    {\n        x=T->root;\n        first=0;\n    }\n    else\n    {\n        x=T;\n    }\n\n    \n    while(i <= x->n && k> x->key[i])\n    {\n        i++;\n    }\n    if(i <= x->n && k == x->key[i])\n    {\n        if(search[0]==1)\n        {\n            printf("znaleziono\\n");\n        }\n        search[1]=1;\n        return;\n    }\n    if(x->leaf==1)\n    {\n        if(search[0]==1)\n        {\n            printf("nie znaleziono\\n");\n        }\n        search[1]=0;\n        return;\n    }\n    else\n    {\n        BtreeSearch(x->c[i], k, first, search);\n    }\n}\n\nvoid BtreeSplitChild(struct btree *x, int i, struct btree *y)\n{\n    int j=1;\n    struct btree *z;\n    z=(struct btree *)malloc(sizeof(struct btree));\n    z->leaf=y->leaf;\n    z->n=2; // t-1=2\n    \n    for(j; j<=2; j++) // t-1=2\n    {\n        z->key[j]=y->key[j+3]; // t=3\n    }\n    if(y->leaf==0)\n    {\n        j=1;\n        for(j; j<=3; j++) // t=3\n        {\n            z->c[j]=y->c[j+3]; // t=3\n        }\n    }\n    y->n=2; // t-1=2\n    j=x->n+1;\n    for(j; j>=i+1; j--)\n    {\n        x->c[j+1]=x->c[j];\n    }\n    x->c[i+1]=z;\n    j=x->n;\n    for(j; j>=i; j--)\n    {\n        x->key[j+1]=x->key[j];\n    }\n    x->key[i]=y->key[3]; // t=3\n    x->n=x->n+1;\n}\nvoid BtreeInsert(struct btree *T, int k, int *used)\n{\n    struct btree *r;\n    r=T->root;\n    if(r->n==5) // 2t-1=5 jezeli jest przepelniony\n    {\n        struct btree *s;\n        s=(struct btree *)malloc(sizeof(struct btree));\n        T->root=s;\n        s->leaf=0;\n        s->n=0;\n        s->c[1]=r;\n        BtreeSplitChild(s, 1, r);\n        BtreeInsertNonFull(s, k, used);\n    }\n    else\n    {\n        BtreeInsertNonFull(r, k, used);\n    }\n}\nvoid BtreeInsertNonFull(struct btree *x, int k, int *used)\n{\n    int i=x->n;\n    if(x->leaf == 1)\n    {\n        while(i >= 1 && k < x->key[i])\n        {\n            x->key[i+1]=x->key[i];\n            i--;\n        }\n        x->key[i+1]=k;\n        x->n=x->n+1;\n        used[0]=1;\n    }\n    else\n    {\n        while(i >= 1 && k < x->key[i])\n        {\n            i--;\n        }\n        i++;\n        if(x->c[i]->n==5)\n        {\n            BtreeSplitChild(x, i, x->c[i]);\n            if(k > x->key[i])\n            {\n                i++;\n            }\n        }\n        BtreeInsertNonFull(x->c[i], k, used);\n    }\n}', 'clike', 'test'),
(19, 8, '#include <stdio.h>\n#include <stdlib.h>\n// test2\nstruct btree\n{\n    int leaf;\n    int n; // ilosc kluczy\n    int key[6]; // na wszelki wypadek +1\n    struct btree *root;\n    struct btree *c[7];\n};\nvoid BtreeSearch(struct btree *x, int k, int first, int *search);\nvoid BtreeCreate(struct btree *T);\nvoid BtreeSplitChild(struct btree *x, int i, struct btree *y);\nvoid BtreeInsert(struct btree *T, int k, int *used);\nvoid BtreeInsertNonFull(struct btree *x, int k, int *used);\nvoid Print(struct btree *T, int first);\n\nint main()\n{\n    int first;\n    int search[2];\n    int used[1];\n    int number;\n    char input;\n    struct btree *start;\n    start=(struct btree *)malloc(sizeof(struct btree));\n    BtreeCreate(start);\n    used[0]=0;\n    while(scanf("%c", &input)!=EOF)\n    {\n        if(input==''W'')\n        {\n            if(used[0]!=0)\n            {\n                first=1;\n                Print(start, first);\n                printf("\\n");\n            }\n            else\n            {\n                printf("( ) \\n");\n            }\n        }\n        if(input==''D'')\n        {\n            scanf("%d", &number);\n            if(used[0]!=0)\n            {\n                first=1;\n                search[0]=0;\n                BtreeSearch(start, number, first, search);\n            }\n            if(search[1]==0 || used[0]==0)\n            {\n                BtreeInsert(start, number, used);\n            }\n        }\n        if(input==''S'')\n        {\n            scanf("%d", &number);\n            if(used[0]!=0)\n            {\n                first=1;\n                search[0]=1;\n                BtreeSearch(start, number, first, search);\n            }\n            else\n            {\n                printf(":(\\n");\n            }\n        }\n    }\n    return 0;\n}\nvoid Print(struct btree *T, int first)\n{\n    struct btree *x;\n    if(first==1)\n    {\n        x=T->root;\n        first=0;\n    }\n    else\n    {\n        x=T;\n    }\n    if(x->leaf==1)\n    {\n        int i=1;\n        printf("( ");\n        for(i; i<=x->n; i++)\n        {\n            printf("%d ", x->key[i]);\n        }\n        printf(") ");\n    }\n    else\n    {\n        int j=1;\n        printf("( ");\n        for(j; j<=x->n; j++)\n        {\n            Print(x->c[j], first);\n            printf("%d ", x->key[j]);            \n        }\n        Print(x->c[x->n+1], first);\n        printf(") ");\n    }\n}\nvoid BtreeCreate(struct btree *T)\n{\n    struct btree *x;\n    x=(struct btree *)malloc(sizeof(struct btree));\n    x->leaf=1;\n    x->n=0;\n    T->root=x;\n}\nvoid BtreeSearch(struct btree *T, int k, int first, int *search)\n{\n    int i=1;\n    struct btree *NIL, *x;\n    NIL=(struct btree *)malloc(sizeof(struct btree));\n    if(first==1)\n    {\n        x=T->root;\n        first=0;\n    }\n    else\n    {\n        x=T;\n    }\n\n    \n    while(i <= x->n && k> x->key[i])\n    {\n        i++;\n    }\n    if(i <= x->n && k == x->key[i])\n    {\n        if(search[0]==1)\n        {\n            printf("znaleziono\\n");\n        }\n        search[1]=1;\n        return;\n    }\n    if(x->leaf==1)\n    {\n        if(search[0]==1)\n        {\n            printf("nie znaleziono\\n");\n        }\n        search[1]=0;\n        return;\n    }\n    else\n    {\n        BtreeSearch(x->c[i], k, first, search);\n    }\n}\n\nvoid BtreeSplitChild(struct btree *x, int i, struct btree *y)\n{\n    int j=1;\n    struct btree *z;\n    z=(struct btree *)malloc(sizeof(struct btree));\n    z->leaf=y->leaf;\n    z->n=2; // t-1=2\n    \n    for(j; j<=2; j++) // t-1=2\n    {\n        z->key[j]=y->key[j+3]; // t=3\n    }\n    if(y->leaf==0)\n    {\n        j=1;\n        for(j; j<=3; j++) // t=3\n        {\n            z->c[j]=y->c[j+3]; // t=3\n        }\n    }\n    y->n=2; // t-1=2\n    j=x->n+1;\n    for(j; j>=i+1; j--)\n    {\n        x->c[j+1]=x->c[j];\n    }\n    x->c[i+1]=z;\n    j=x->n;\n    for(j; j>=i; j--)\n    {\n        x->key[j+1]=x->key[j];\n    }\n    x->key[i]=y->key[3]; // t=3\n    x->n=x->n+1;\n}\nvoid BtreeInsert(struct btree *T, int k, int *used)\n{\n    struct btree *r;\n    r=T->root;\n    if(r->n==5) // 2t-1=5 jezeli jest przepelniony\n    {\n        struct btree *s;\n        s=(struct btree *)malloc(sizeof(struct btree));\n        T->root=s;\n        s->leaf=0;\n        s->n=0;\n        s->c[1]=r;\n        BtreeSplitChild(s, 1, r);\n        BtreeInsertNonFull(s, k, used);\n    }\n    else\n    {\n        BtreeInsertNonFull(r, k, used);\n    }\n}\nvoid BtreeInsertNonFull(struct btree *x, int k, int *used)\n{\n    int i=x->n;\n    if(x->leaf == 1)\n    {\n        while(i >= 1 && k < x->key[i])\n        {\n            x->key[i+1]=x->key[i];\n            i--;\n        }\n        x->key[i+1]=k;\n        x->n=x->n+1;\n        used[0]=1;\n    }\n    else\n    {\n        while(i >= 1 && k < x->key[i])\n        {\n            i--;\n        }\n        i++;\n        if(x->c[i]->n==5)\n        {\n            BtreeSplitChild(x, i, x->c[i]);\n            if(k > x->key[i])\n            {\n                i++;\n            }\n        }\n        BtreeInsertNonFull(x->c[i], k, used);\n    }\n}', 'clike', 'test2');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(30) NOT NULL,
  `haslo` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin2 AUTO_INCREMENT=9 ;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `login`, `haslo`) VALUES
(4, 'misiom1', 'ca16caed2ca92304e0a3c486469028536003fbb2'),
(5, 'aneta57', '3fee8681c6eb82ee6284672736f18b7bd5c3763c'),
(6, 'misio', 'ca16caed2ca92304e0a3c486469028536003fbb2'),
(7, 'misiom', 'ca16caed2ca92304e0a3c486469028536003fbb2'),
(8, 'x', '11f6ad8ec52a2984abaafd7c3b516503785c2072');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
