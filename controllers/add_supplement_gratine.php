<?php
require_once __DIR__ . '/../database.php';

function addSupplementGratine() {
    global $db;
    $nom = $_POST['nom'] ?? null;
    $prix = $_POST['prix'] ?? null;

    if (!$nom || !$prix) {
        return ['error' => 'Champs requis manquants'];
    }

    $unique_id = 'gratine_' . uniqid();
    $query = "INSERT INTO supplement_gratine (id_supplement_gratine, nom_supplement_gratine, supplement_gratine_prix) 
              VALUES (?, ?, ?)";
    $stmt = $db->prepare($query);

    if ($stmt === false) {
        return ['error' => 'Erreur dans la préparation de la requête'];
    }

    $stmt->bind_param('sss', $unique_id, $nom, $prix);

    if ($stmt->execute()) {
        return [
            'message' => 'Supplement Gratine ajouté avec succès',
            'id' => $unique_id
        ];
    } else {
        return ['error' => 'Erreur lors de l\'ajout d\'un supplement gratine'];
    }

}