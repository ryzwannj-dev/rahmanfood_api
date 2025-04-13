<?php
require_once __DIR__ . '/../database.php';

function addDessert() {
    global $db;
    $nom = $_POST['nom']?? null;
    $prix = $_POST['prix']?? null;

    if (!$nom ||!$prix) {
        return ['error' => 'Champs requis manquants'];
    }

    $unique_id = 'dessert_'. uniqid();
    $query = "INSERT INTO dessert (id_dessert, nom_dessert, prix_dessert)
              VALUES (?,?,?)";
    $stmt = $db->prepare($query);

    if ($stmt === false) {
        return ['error' => 'Erreur dans la préparation de la requête'];
  
    }

    $stmt->bind_param('sss', $unique_id, $nom, $prix);

    if ($stmt->execute()) {
        return [
           'message' => 'Dessert ajouté avec succès',
            'id' => $unique_id
        ];  
    }
    else {
        return ['error' => 'Erreur lors de l\'ajout d\'un dessert'];
    }
}