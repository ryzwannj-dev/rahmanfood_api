<?php
require_once __DIR__ . '/../database.php';

function getAllIngredients() {
    global $db;
    $ingredients = [];
    
    // Requête pour récupérer tous les ingrédients
    $query = "SELECT DISTINCT i.id_ingredient, i.nom_ingredient, i.masse_ingredient AS masse
              FROM ingredient i 
              ORDER BY i.nom_ingredient";
              
    // Exécuter la requête
    $result = $db->query($query);

    // Vérifier si la requête a renvoyé des résultats
    if ($result) {
        // Parcourir les résultats ligne par ligne
        while ($row = $result->fetch_assoc()) {
            $ingredients[] = [
                'id' => $row['id_ingredient'],
                'nom' => $row['nom_ingredient'],
                'masse' => $row['masse']
            ];
        }
    }

    // Retourner les ingrédients sous forme de tableau
    return $ingredients;
}

// Fonction pour ajouter un ingrédient
function addIngredient() {
    global $db;

    $nom = $_POST['nom'] ?? null;
    $masse = $_POST['masse'] ?? null;
    $id_type = $_POST['id_type_ingredient'] ?? null;

    if (!$nom || !$masse || !$id_type) {
        return ['error' => 'Champs requis manquants'];
    }

    // Générer un ID unique qui commence par ing_
    $unique_id = 'ing_' . uniqid();

    $query = "INSERT INTO ingredient (id_ingredient, nom_ingredient, masse_ingredient, id_type_ingredient) 
              VALUES (?, ?, ?, ?)";
    $stmt = $db->prepare($query);

    if ($stmt === false) {
        return ['error' => 'Erreur dans la préparation de la requête'];
    }

    $stmt->bind_param('ssss', $unique_id, $nom, $masse, $id_type);

    if ($stmt->execute()) {
        return [
            'message' => 'Ingrédient ajouté avec succès',
            'id' => $unique_id
        ];
    } else {
        return ['error' => 'Erreur lors de l\'ajout de l\'ingrédient'];
    }
}

