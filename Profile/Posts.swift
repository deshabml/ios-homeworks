//
//  Posts.swift
//  Navigation
//
//  Created by Лаборатория on 11.12.2022.
//

import Foundation

struct Post {
        var author: String
        var description: String
        var image: String
        var likes: Int
        var views: Int
}

let posts: [Post] = [
    Post(author: "Хендай Автоклуб",
         description: """
                    Их осталось 11!
                    Новых иномарок на официальном автомобильном рынке в России немного - это 11 китайских брендов. В Новый 2023 год Россия вступает с уникальным составом автомобильного ассортимента — наш авторынок уже китайский на 78%.

                    Ещё в феврале 2022 в РФ официально работали 60 автомобильных брендов. На отечественном рынке осталось три российских бренда...
                    """,
         image: "avto_v_rf",
         likes: 15,
         views: 731),
    Post(author: "Тольяти.Ру",
         description: "ВАЗ, УАЗ, Камаз, Белаз",
         image: "uaz_na_glaz",
         likes: 2,
         views: 66),
    Post(author: "Наука и Техника",
         description: "Природа включила Айвазовского",
         image: "priroda_aivozovskiy",
         likes: 337,
         views: 24_000),
    Post(author: "Я Электрик",
         description: """
                    Вот такой подарок электрику от пчел.
                    Подвид медоностных пчёл с допуском до и выше 1000 вольт
                    """,
         image: "pchela_elektric",
         likes: 327,
         views: 29_000)
]
