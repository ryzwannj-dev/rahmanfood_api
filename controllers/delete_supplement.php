<?php
require_once __DIR__ . '/../database.php';

function deleteSupplementById() {
    global $db;
    
    // Vérifier si l'ID est fourni
    if (!isset($_POST['id'])) {
        http_response_code(400);
        return ['error' => 'ID du supplément non fourni'];
    }
    
    $id = $_POST['id'];
    
    // Vérifier si le supplément existe
    $check_query = "SELECT id_supplement FROM supplement WHERE id_supplement = ?";
    $check_stmt = $db->prepare($check_query);
    if (!$check_stmt) {
        http_response_code(500);
        return ['error' => 'Erreur de préparation de la requête: ' . $db->error];
    }
    
    $check_stmt->bind_param('s', $id);
    if (!$check_stmt->execute()) {
        http_response_code(500);
        return ['error' => 'Erreur lors de la vérification du supplément: ' . $check_stmt->error];
    }
    
    $result = $check_stmt->get_result();
    if ($result->num_rows === 0) {
        http_response_code(404);
        return ['error' => 'Supplément non trouvé'];
    }

    // Démarrer une transaction
    if (!$db->begin_transaction()) {
        http_response_code(500);
        return ['error' => 'Erreur lors du démarrage de la transaction'];
    }

    try {
        // Supprimer d'abord les relations dans la table peut_avoir
        $delete_peut_avoir_query = "DELETE FROM peut_avoir WHERE id_supplement = ?";
        $delete_peut_avoir_stmt = $db->prepare($delete_peut_avoir_query);
        if (!$delete_peut_avoir_stmt) {
            throw new Exception('Erreur de préparation de la requête de suppression des relations peut_avoir: ' . $db->error);
        }
        
        $delete_peut_avoir_stmt->bind_param('s', $id);
        if (!$delete_peut_avoir_stmt->execute()) {
            throw new Exception('Erreur lors de la suppression des relations peut_avoir: ' . $delete_peut_avoir_stmt->error);
        }

        // Supprimer le supplément
        $delete_query = "DELETE FROM supplement WHERE id_supplement = ?";
        $delete_stmt = $db->prepare($delete_query);
        if (!$delete_stmt) {
            throw new Exception('Erreur de préparation de la requête de suppression: ' . $db->error);
        }
        
        $delete_stmt->bind_param('s', $id);
        if (!$delete_stmt->execute()) {
            throw new Exception('Erreur lors de la suppression du supplément: ' . $delete_stmt->error);
        }

        // Valider la transaction
        if (!$db->commit()) {
            throw new Exception('Erreur lors de la validation de la transaction');
        }
        
        return ['message' => 'Supplément et ses relations supprimés avec succès'];

    } catch (Exception $e) {
        // En cas d'erreur, annuler la transaction
        $db->rollback();
        http_response_code(500);
        return ['error' => $e->getMessage()];
    }
}