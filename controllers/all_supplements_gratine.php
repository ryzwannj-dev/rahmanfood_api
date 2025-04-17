<?php
require_once __DIR__ . '/../database.php';

function get_Supplements_Gratine(){
    global $db;
    $items = [];

    $query = "
        SELECT
            supplement_gratine.id_supplement_gratine,
            supplement_gratine.nom_supplement_gratine,
            supplement_gratine.supplement_gratine_prix
        FROM supplement_gratine
        ORDER BY supplement_gratine.supplement_gratine_prix ASC

    ";

    $result = $db->query($query);

    while ($row = $result->fetch_assoc()) {
        $items[] = [
            'id' => $row['id_supplement_gratine'],
            'nom' => $row['nom_supplement_gratine'],
            'prix' => $row['supplement_gratine_prix'],	
        ]; 	
    }
    return $items;
}
