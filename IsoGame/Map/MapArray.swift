//
// Created by Nikolay Yushkevich on 23.10.16.
// Copyright (c) 2016 Dmitriy Kapitun. All rights reserved.
//

let tiles = [
        [(1, 7), (1, 0), (1, 0), (1, 0), (1, 0), (1, 0), (1, 0), (1, 0), (1, 0), (1, 0), (1, 0), (1, 0), (1, 0), (1, 0), (1, 0), (1, 0), (1, 0), (1, 1)],
        [(1, 6), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (1, 2)],
        [(1, 6), (0, 0), (0, 0), (3, 0), (3, 0), (3, 0), (3, 0), (3, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (1, 2)],
        [(1, 6), (0, 0), (0, 0), (3, 0), (0, 0), (0, 0), (0, 0), (3, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (1, 2)],
        [(1, 6), (0, 0), (3, 0), (3, 0), (0, 0), (0, 0), (0, 0), (3, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (1, 2)],
        [(1, 6), (0, 0), (3, 0), (0, 0), (0, 0), (0, 0), (3, 0), (3, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (1, 2)],
        [(1, 6), (0, 0), (3, 0), (0, 0), (0, 0), (0, 0), (3, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (1, 2)],
        [(1, 6), (3, 0), (3, 0), (0, 0), (0, 0), (0, 0), (3, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (1, 2)],
        [(1, 6), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (3, 0), (3, 0), (3, 0), (3, 0), (3, 0), (0, 0), (0, 0), (0, 0), (3, 0), (3, 0), (3, 0), (1, 2)],
        [(1, 6), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (3, 0), (0, 0), (0, 0), (0, 0), (3, 0), (0, 0), (0, 0), (1, 2)],
        [(1, 6), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (3, 0), (0, 0), (0, 0), (0, 0), (3, 0), (0, 0), (0, 0), (1, 2)],
        [(1, 6), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (3, 0), (0, 0), (0, 0), (0, 0), (3, 0), (0, 0), (0, 0), (1, 2)],
        [(1, 6), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (3, 0), (3, 0), (0, 0), (0, 0), (3, 0), (3, 0), (0, 0), (0, 0), (1, 2)],
        [(1, 6), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (3, 0), (0, 0), (0, 0), (0, 0), (3, 0), (0, 0), (0, 0), (0, 0), (1, 2)],
        [(1, 6), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (3, 0), (3, 0), (3, 0), (3, 0), (3, 0), (0, 0), (0, 0), (0, 0), (1, 2)],
        [(1, 6), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0),(0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (1, 2)],
        [(1, 6), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (1, 2)],
        [(1, 5), (1, 4), (1, 4), (1, 4), (1, 4), (1, 4), (1, 4), (1, 4), (1, 4), (1, 4), (1, 4), (1, 4), (1, 4), (1, 4), (1, 4), (1, 4), (1, 4), (1, 3)]

]

let newTiles = [
        [24, 24, 17, 17, 16, 16, 18, 17, 17, 16, 22, 16, 16, 17, 19, 17, 16, 21, 20, 16, 17, 17, 16, 17, 17],
        [24, 23, 13, 13, 13, 13, 15, 15, 15, 15, 14, 14, 13, 14, 13, 14, 14, 15, 15, 14, 13, 14, 14, 13, 17],
        [23, 13, 15, 15, 13, 14, 15, 15, 14, 14, 14, 15, 13, 14, 15, 14, 15, 13, 14, 14, 13, 14, 15, 14, 16],
        [17, 13, 7, 3, 3, 3, 3, 3, 3, 6, 14, 14, 7, 3, 3, 3, 3, 3, 3, 3, 3, 3, 6, 14, 17],
        [24, 15, 0, 12, 12, 12, 12, 12, 12, 1, 13, 13, 0, 12, 12, 12, 12, 12, 12, 12, 12, 12, 1, 13, 16],
        [24, 15, 0, 12, 11, 2, 2, 10, 12, 1, 13, 13, 0, 12, 11, 2, 2, 2, 2, 2, 10, 12, 1, 15, 16],
        [24, 15, 0, 12, 1, 15, 14, 0, 12, 1, 15, 13, 0, 12, 1, 15, 15, 15, 15, 13, 0, 12, 1, 13, 16],
        [20, 14, 0, 12, 1, 15, 14, 0, 12, 1, 13, 15, 0, 12, 1, 15, 15, 15, 15, 15, 0, 12, 1, 14, 16],
        [16, 13, 0, 12, 1, 13, 14, 0, 12, 1, 13, 14, 0, 12, 1, 15, 15, 15, 14, 13, 0, 12, 1, 13, 16],
        [3, 3, 8, 12, 1, 14, 15, 0, 12, 1, 14, 13, 0, 12, 1, 15, 15, 15, 14, 13, 0, 12, 1, 15, 17],
        [12, 12, 12, 12, 1, 15, 15, 0, 12, 1, 13, 14, 0, 12, 1, 15, 15, 15, 15, 15, 0, 12, 1, 13, 17],
        [2, 2, 2, 2, 4, 13, 14, 0, 12, 1, 15, 14, 0, 12, 9, 3, 3, 6, 15, 13, 0, 12, 1, 13, 17],
        [16, 14, 15, 14, 14, 15, 13, 0, 12, 1, 13, 15, 0, 12, 12, 12, 12, 1, 15, 14, 0, 12, 1, 13, 17],
        [17, 15, 15, 14, 15, 15, 13, 0, 12, 1, 15, 15, 5, 2, 2, 10, 12, 1, 13, 13, 0, 12, 1, 13, 16],
        [24, 13, 14, 14, 14, 13, 14, 0, 12, 1, 14, 13, 14, 13, 14, 0, 12, 1, 15, 15, 0, 12, 1, 14, 17],
        [24, 15, 15, 15, 14, 14, 13, 0, 12, 1, 13, 15, 14, 14, 14, 0, 12, 1, 15, 15, 0, 12, 1, 15, 16],
        [24, 13, 14, 15, 13, 13, 13, 0, 12, 1, 15, 13, 13, 15, 14, 0, 12, 1, 14, 13, 0, 12, 1, 14, 17],
        [19, 13, 13, 14, 13, 14, 13, 0, 12, 9, 3, 3, 3, 3, 3, 8, 12, 1, 13, 14, 0, 12, 1, 14, 17],
        [17, 15, 14, 14, 15, 14, 15, 0, 12, 12, 12, 12, 12, 12, 12, 12, 12, 1, 13, 15, 0, 12, 1, 15, 17],
        [17, 14, 14, 14, 13, 15, 13, 5, 2, 2, 2, 2, 2, 2, 2, 2, 2, 4, 13, 14, 0, 12, 1, 15, 17],
        [24, 15, 13, 14, 15, 14, 15, 15, 14, 14, 13, 15, 15, 15, 13, 15, 14, 14, 15, 14, 0, 12, 1, 15, 16],
        [24, 14, 15, 15, 14, 14, 15, 15, 14, 14, 15, 13, 13, 15, 15, 14, 13, 13, 15, 14, 5, 2, 4, 14, 17],
        [17, 16, 14, 14, 15, 14, 13, 13, 15, 15, 14, 14, 13, 15, 13, 14, 15, 13, 13, 15, 13, 15, 13, 14, 17],
        [24, 17, 15, 15, 13, 15, 15, 15, 14, 13, 14, 15, 13, 13, 13, 14, 15, 14, 14, 13, 14, 15, 15, 13, 16],
        [24, 24, 16, 17, 21, 20, 17, 17, 17, 16, 17, 17, 16, 16, 17, 17, 17, 16, 17, 17, 17, 17, 17, 16, 16]

]