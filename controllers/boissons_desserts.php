<?php
require_once __DIR__ . '/../database.php';

function getBoissons() {
    global $db;
    $items = [];
    
    $query = "SELECT id_boisson, nom_boisson, prix_boisson FROM boisson";
    $result = $db->query($query);
    
    while ($row = $result->fetch_assoc()) {
        $items[] = [
            'id' => $row['id_boisson'],
            'nom' => $row['nom_boisson'],
            'prix' => $row['prix_boisson'],
            'ingredients' => [],
            'categorie' => 'Boissons'
        ];
    }
    
    return $items;
}

function getDesserts() {
    global $db;
    $items = [];
    
    $query = "SELECT id_dessert, nom_dessert, prix_dessert FROM dessert";
    $result = $db->query($query);
    
    while ($row = $result->fetch_assoc()) {
        $items[] = [
            'id' => $row['id_dessert'],
            'nom' => $row['nom_dessert'],
            'prix' => $row['prix_dessert'],
            'ingredients' => [],
            'categorie' => 'Desserts'
        ];
    }
    
    return $items;
}