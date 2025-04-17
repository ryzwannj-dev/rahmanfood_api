<?php
require_once __DIR__ . '/../database.php';

function initializeForeignKeyConstraints() {
    global $db;
    
    // Supprimer les anciennes contraintes
    $dropConstraints = [
        "ALTER TABLE composer_pizza DROP FOREIGN KEY IF EXISTS composer_pizza_ibfk_2",
        "ALTER TABLE composer_burger DROP FOREIGN KEY IF EXISTS composer_burger_ibfk_2",
        "ALTER TABLE composer_sandwich DROP FOREIGN KEY IF EXISTS composer_sandwich_ibfk_2",
        "ALTER TABLE composer_tacos DROP FOREIGN KEY IF EXISTS composer_tacos_ibfk_2",
        "ALTER TABLE composer_texmex DROP FOREIGN KEY IF EXISTS composer_texmex_ibfk_1",
        "ALTER TABLE composer_assiette DROP FOREIGN KEY IF EXISTS composer_assiette_ibfk_1"
    ];

    // Ajouter les nouvelles contraintes avec ON DELETE CASCADE
    $addConstraints = [
        "ALTER TABLE composer_pizza ADD CONSTRAINT composer_pizza_ibfk_2 FOREIGN KEY (id_ingredient) REFERENCES ingredient (id_ingredient) ON DELETE CASCADE",
        "ALTER TABLE composer_burger ADD CONSTRAINT composer_burger_ibfk_2 FOREIGN KEY (id_ingredient) REFERENCES ingredient (id_ingredient) ON DELETE CASCADE",
        "ALTER TABLE composer_sandwich ADD CONSTRAINT composer_sandwich_ibfk_2 FOREIGN KEY (id_ingredient) REFERENCES ingredient (id_ingredient) ON DELETE CASCADE",
        "ALTER TABLE composer_tacos ADD CONSTRAINT composer_tacos_ibfk_2 FOREIGN KEY (id_ingredient) REFERENCES ingredient (id_ingredient) ON DELETE CASCADE",
        "ALTER TABLE composer_texmex ADD CONSTRAINT composer_texmex_ibfk_1 FOREIGN KEY (id_ingredient) REFERENCES ingredient (id_ingredient) ON DELETE CASCADE",
        "ALTER TABLE composer_assiette ADD CONSTRAINT composer_assiette_ibfk_1 FOREIGN KEY (id_ingredient) REFERENCES ingredient (id_ingredient) ON DELETE CASCADE"
    ];

    try {
        // Exécuter les requêtes de suppression
        foreach ($dropConstraints as $query) {
            $db->query($query);
        }

        // Exécuter les requêtes d'ajout
        foreach ($addConstraints as $query) {
            $db->query($query);
        }
        
        return true;
    } catch (Exception $e) {
        error_log('Erreur lors de l\'initialisation des contraintes : ' . $e->getMessage());
        return false;
    }
}

function deleteIngredient() {
    global $db;
    
    // Initialiser les contraintes de clé étrangère si nécessaire
    static $initialized = false;
    if (!$initialized) {
        initializeForeignKeyConstraints();
        $initialized = true;
    }

    if (isset($_POST['delete'])) {
        $ingredientId = $_POST['delete'];
        
        try {
            // Supprimer l'ingrédient (la suppression en cascade est gérée par la base de données)
            $query = "DELETE FROM ingredient WHERE id_ingredient = ?";
            $stmt = $db->prepare($query);
            if ($stmt === false) {
                throw new Exception('Erreur dans la préparation de la requête');
            }
            $stmt->bind_param("s", $ingredientId);
            $stmt->execute();
            
            if ($stmt->affected_rows > 0) {
                return ['success' => 'Ingrédient supprimé avec succès'];
            } else {
                return ['error' => 'Aucun ingrédient trouvé avec cet identifiant'];
            }

        } catch (Exception $e) {
            return ['error' => $e->getMessage()];
        }
    }
    return ['error' => 'Aucun ingrédient spécifié pour la suppression'];
}