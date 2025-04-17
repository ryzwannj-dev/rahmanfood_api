<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: POST');

require_once '../database.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $postData = file_get_contents('php://input');
    if (empty($postData)) {
        $postData = $_POST;
    } else {
        parse_str($postData, $postData);
    }

    // Vérifier si tous les champs requis sont présents
    if (!isset($postData['id']) || !isset($postData['nom']) || !isset($postData['prix'])) {
        echo json_encode(['error' => 'Champs requis manquants']);
        exit;
    }

    $id = trim($postData['id']);
    $nom = trim($postData['nom']);
    $prix = floatval(str_replace(',', '.', $postData['prix']));

    if (empty($id) || empty($nom) || $prix <= 0) {
        echo json_encode(['error' => 'Données invalides']);
        exit;
    }

    $db = Database::getInstance();
    $conn = $db->getConnection();

    // Vérifier si le supplément existe
    $check_stmt = $conn->prepare('SELECT id_supplement FROM supplement WHERE id_supplement = ?');
    $check_stmt->bind_param('s', $id);
    $check_stmt->execute();
    $result = $check_stmt->get_result();

    if ($result->num_rows === 0) {
        echo json_encode(['error' => 'Supplément non trouvé']);
        exit;
    }
    $check_stmt->close();

    // Mettre à jour le supplément
    $update_stmt = $conn->prepare('UPDATE supplement SET nom_supplement = ?, prix_supplement = ? WHERE id_supplement = ?');
    $update_stmt->bind_param('sds', $nom, $prix, $id);

    if ($update_stmt->execute()) {
        echo json_encode([
            'message' => 'Supplément modifié avec succès',
            'id' => $id,
            'nom' => $nom,
            'prix' => $prix
        ]);
    } else {
        echo json_encode(['error' => 'Erreur lors de la modification du supplément']);
    }
    $update_stmt->close();
} else {
    echo json_encode(['error' => 'Méthode non autorisée']);
}