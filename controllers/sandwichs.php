<?php
require_once __DIR__ . '/../database.php';
require_once __DIR__ . '/../utils/ingredients.php';

function getSandwichs() {
    global $db;
    $items = [];
    
    $query = "SELECT id_sandwich, nom_sandwich, prix_sandwich FROM sandwich";
    $result = $db->query($query);
    
    while ($row = $result->fetch_assoc()) {
        $items[] = [
            'id' => $row['id_sandwich'],
            'nom' => $row['nom_sandwich'],
            'prix' => $row['prix_sandwich'],
            'ingredients' => getIngredients('sandwich', $row['id_sandwich']),
            'categorie' => 'Sandwichs'
        ];
    }
    
    return $items;
}