<?php
require_once __DIR__ . '/../database.php';
require_once __DIR__ . '/../utils/ingredients.php';

function getAssiettes() {
    global $db;
    $items = [];
    
    $query = "SELECT id_assiette, nom_assiette, prix_assiette FROM assiette";
    $result = $db->query($query);
    
    while ($row = $result->fetch_assoc()) {
        $items[] = [
            'id' => $row['id_assiette'],
            'nom' => $row['nom_assiette'],
            'prix' => $row['prix_assiette'],
            'ingredients' => getIngredients('assiette', $row['id_assiette']),
            'categorie' => 'Assiettes'
        ];
    }
    
    return $items;
}