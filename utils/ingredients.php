<?php
require_once __DIR__ . '/../database.php';

function getIngredients($type, $id) {
    global $db;
    $ingredients = [];
    
    $table_name = "composer_" . strtolower($type);
    $id_column = "id_" . strtolower($type);
    
    $query = "SELECT i.id_ingredient, i.nom_ingredient, c.quantite 
              FROM {$table_name} c 
              JOIN ingredient i ON c.id_ingredient = i.id_ingredient 
              WHERE c.{$id_column} = ?";
              
    $stmt = $db->prepare($query);
    $stmt->bind_param('s', $id);
    $stmt->execute();
    $result = $stmt->get_result();
    
    while ($row = $result->fetch_assoc()) {
        $ingredients[] = [
            'id' => $row['id_ingredient'],
            'nom' => $row['nom_ingredient'],
            'quantite' => $row['quantite']
        ];
    }
    
    return $ingredients;
}