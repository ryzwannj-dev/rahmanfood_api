<?php
require_once __DIR__ . '/../database.php';
require_once __DIR__ . '/../utils/ingredients.php';

function getPizzas() {
    global $db;
    $items = [];
    
    $query = "SELECT p.id_pizza, p.nom_pizza, tp.prix_taille_pizza as prix FROM pizza p 
             JOIN taille_pizza tp ON p.id_taille_pizza = tp.id_taille_pizza";
    $result = $db->query($query);
    
    while ($row = $result->fetch_assoc()) {
        $items[] = [
            'id' => $row['id_pizza'],
            'nom' => $row['nom_pizza'],
            'prix' => $row['prix'],
            'ingredients' => getIngredients('pizza', $row['id_pizza']),
            'categorie' => 'Pizzas'
        ];
    }
    
    return $items;
}