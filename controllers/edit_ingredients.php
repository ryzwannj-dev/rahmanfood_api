<?php
require_once __DIR__ . '/../database.php';

function editIngredient() {
    global $db;

    $id = $_POST['id'] ?? null;
    $nom = $_POST['nom'] ?? null;
    $masse = $_POST['masse'] ?? null;
    $id_type = $_POST['id_type_ingredient'] ?? null;

    if (!$id || !$nom || !$masse || !$id_type) {
        return ['error' => 'Champs requis manquants'];
    }

    // Vérifier si l'ingrédient existe
    $check_query = "SELECT id_ingredient FROM ingredient WHERE id_ingredient = ?";
    $check_stmt = $db->prepare($check_query);

    if ($check_stmt === false) {
        return ['error' => 'Erreur dans la préparation de la requête de vérification'];
    }

    $check_stmt->bind_param('s', $id);
    $check_stmt->execute();
    $check_result = $check_stmt->get_result();

    if ($check_result->num_rows === 0) {
        return ['error' => 'Ingrédient non trouvé'];
    }

    // Mettre à jour l'ingrédient
    $update_query = "UPDATE ingredient SET nom_ingredient = ?, masse_ingredient = ?, id_type_ingredient = ? WHERE id_ingredient = ?";
    $update_stmt = $db->prepare($update_query);

    if ($update_stmt === false) {
        return ['error' => 'Erreur dans la préparation de la requête de mise à jour'];
    }

    $update_stmt->bind_param('ssss', $nom, $masse, $id_type, $id);

    if ($update_stmt->execute()) {
        return [
            'message' => 'Ingrédient modifié avec succès',
            'id' => $id
        ];
    } else {
        return ['error' => 'Erreur lors de la modification de l\'ingrédient'];
    }
}