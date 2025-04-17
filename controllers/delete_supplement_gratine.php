<?php
require_once __DIR__ . '/../database.php';

function deleteSupplementGratineById() {
    global $db;
    
    // Vérifier si la requête est de type POST
    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        return ['error' => 'Méthode non autorisée'];
    }

    // Récupérer et valider l'ID
    $raw_data = file_get_contents('php://input');
    parse_str($raw_data, $post_data);
    $id = isset($post_data['id']) ? $post_data['id'] : (isset($_POST['id']) ? $_POST['id'] : null);

    if (!$id) {
        return ['error' => 'ID du supplément gratiné manquant'];
    }

    // Nettoyer l'ID
    $id = trim($id);

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

    // Supprimer les références dans la table tacos_a_supplement_gratine
    $delete_refs_query = "DELETE FROM tacos WHERE id_supplement_gratine = ?";
    $delete_refs_stmt = $db->prepare($delete_refs_query);

    if ($delete_refs_stmt === false) {
        return ['error' => 'Erreur dans la préparation de la requête de suppression des références'];
    }

    $delete_refs_stmt->bind_param('s', $id);
    $delete_refs_stmt->execute();

    // Supprimer le supplément gratiné
    $delete_query = "DELETE FROM supplement_gratine WHERE id_supplement_gratine = ?";
    $delete_stmt = $db->prepare($delete_query);

    if ($delete_stmt === false) {
        return ['error' => 'Erreur dans la préparation de la requête de suppression'];
    }

    $delete_stmt->bind_param('s', $id);

    if ($delete_stmt->execute()) {
        return ['message' => 'Supplément gratiné supprimé avec succès'];
    } else {
        return ['error' => 'Erreur lors de la suppression du supplément gratiné'];
    }
}