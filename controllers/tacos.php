<?php
require_once __DIR__ . '/../database.php';
require_once __DIR__ . '/../utils/ingredients.php';

function getTacos() {
    global $db;
    $items = [];
    
    $query = "SELECT t.id_tacos, tt.taille_tacos AS nom_tacos, tt.prix_taille_tacos AS prix_tacos FROM tacos t JOIN taille_tacos tt ON t.id_taille_tacos = tt.id_taille_tacos";
    $result = $db->query($query);
    
    while ($row = $result->fetch_assoc()) {
        $items[] = [
            'id' => $row['id_tacos'],
            'nom' => $row['nom_tacos'],
            'prix' => $row['prix_tacos'],
            'ingredients' => getIngredients('tacos', $row['id_tacos']),
            'categorie' => 'Tacos'
        ];
    }
    
    return $items;
}