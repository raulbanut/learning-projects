//
//  FoodModel .swift
//  Animations
//
//  Created by Raul Banut on 02.12.2022.
//

import Foundation
import SwiftUI

/// Food Model and Sample Food

struct Food: Identifiable {
    var id = UUID().uuidString
    var title: String
    var description: String
    var price: String
    var image: String
}

var foods = [
    Food(
        title: "Chocolate Cake",
        description: "Chocolate cake is a cake flavored with melted chocolate, cocoa powder or both",
        price: "$19",
        image: "chocolate_cake"
    ),
    Food(
        title: "Sandiwch",
        description: "A sandwich is a food typically consisting of vegetables, sliced cheese or meat, placed on or between slices of bread.",
        price: "$10",
        image: "sandwich"
    ),
    Food(
        title: "Pasta",
        description: "Pasta is a type of food typically made from an unleavened dough of wheat flour mixed with water or eggs.",
        price: "$35",
        image: "pasta"
    ),
    Food(
        title: "Pizza",
        description: "Pizza is a dish of Italian origin consisting of a usually round, flat base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients.",
        price: "$25",
        image: "pizza"
    ),
    Food(
        title: "Cookies",
        description: "A cookie is a baked or cooked snack or dessert that is typically small, flat and sweet. It usually contains flour, sugar, egg, and some type of oil, fat, or butter.",
        price: "$9",
        image: "cookies"
    ),
    Food(
        title: "French Fries",
        description: "French fries, chips, finger chips, french-fried potatoes, or simply fries, are batonnet or allumette-cut deep-fried potatoes of disputed origin from Belgium and France.",
        price: "$9",
        image: "french_fries"
    )
]
