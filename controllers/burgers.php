<?php
require_once __DIR__ . '/../database.php';
require_once __DIR__ . '/../utils/ingredients.php';

function getBurgers() {
    global $db;
    $items = [];
    
    $query = "SELECT id_burger, nom_burger, prix_burger FROM burger";
    $result = $db->query($query);
    
    while ($row = $result->fetch_assoc()) {
        $items[] = [
            'id' => $row['id_burger'],
            'nom' => $row['nom_burger'],
            'prix' => $row['prix_burger'],
            'ingredients' => getIngredients('burger', $row['id_burger']),
            'categorie' => 'Burgers'
        ];
    }
    
    return $items;
}