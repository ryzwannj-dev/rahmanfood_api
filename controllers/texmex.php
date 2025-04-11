<?php
require_once __DIR__ . '/../database.php';
require_once __DIR__ . '/../utils/ingredients.php';

function getTexMex() {
    global $db;
    $items = [];
    
    $query = "SELECT id_texmex, nom_texmex, prix_texmex FROM texmex";
    $result = $db->query($query);
    
    while ($row = $result->fetch_assoc()) {
        $items[] = [
            'id' => $row['id_texmex'],
            'nom' => $row['nom_texmex'],
            'prix' => $row['prix_texmex'],
            'ingredients' => getIngredients('texmex', $row['id_texmex']),
            'categorie' => 'Tex-Mex'
        ];
    }
    
    return $items;
}