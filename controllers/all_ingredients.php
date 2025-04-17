<?php
require_once __DIR__ . '/../database.php';

function get_Ingredients(){
    global $db;
    $items = [];

    $query = "
        SELECT 
            ingredient.id_ingredient,
            ingredient.nom_ingredient,
            ingredient.masse_ingredient,
            ingredient.id_type_ingredient,
            type_ingredient.type_ingredient
        FROM ingredient
        JOIN type_ingredient 
            ON ingredient.id_type_ingredient = type_ingredient.id_type_ingredient
        ORDER BY ingredient.masse_ingredient ASC
    ";
    
    $result = $db->query($query);

    while ($row = $result->fetch_assoc()) {
        $items[] = [
            'id' => $row['id_ingredient'],
            'nom' => $row['nom_ingredient'],
            'masse' => $row['masse_ingredient'],
            'id_type' => $row['id_type_ingredient'],
            'type_ingredient' => $row['type_ingredient'], // le nom du type ici
        ];
    }

    return $items;
}
