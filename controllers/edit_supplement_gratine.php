<?php
require_once __DIR__ . '/../database.php';

function editSupplementGratine() {
    global $db;
    $id = $_POST['id'] ?? null;
    $nom = $_POST['nom'] ?? null;
    $prix = $_POST['prix'] ?? null;

    if (!$id || !$nom || !$prix) {
        return ['error' => 'Champs requis manquants'];
    }

    // Vérifier si le supplément gratiné existe
    $check_query = "SELECT id_supplement_gratine FROM supplement_gratine WHERE id_supplement_gratine = ?";
    $check_stmt = $db->prepare($check_query);

    if ($check_stmt === false) {
        return ['error' => 'Erreur dans la préparation de la requête de vérification'];
    }

    $check_stmt->bind_param('s', $id);
    $check_stmt->execute();
    $result = $check_stmt->get_result();

    if ($result->num_rows === 0) {
        return ['error' => 'Supplément gratiné non trouvé'];
    }

    // Mettre à jour le supplément gratiné
    $update_query = "UPDATE supplement_gratine SET nom_supplement_gratine = ?, supplement_gratine_prix = ? WHERE id_supplement_gratine = ?";
    $update_stmt = $db->prepare($update_query);

    if ($update_stmt === false) {
        return ['error' => 'Erreur dans la préparation de la requête de mise à jour'];
    }

    $update_stmt->bind_param('sss', $nom, $prix, $id);

    if ($update_stmt->execute()) {
        return [
            'message' => 'Supplément gratiné modifié avec succès',
            'id' => $id
        ];
    } else {
        return ['error' => 'Erreur lors de la modification du supplément gratiné'];
    }
}