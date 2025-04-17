<?php
require_once __DIR__ . '/../database.php';

function get_Supplements(){
    global $db;
    $items = [];

    $query = "
        SELECT
            supplement.id_supplement,
            supplement.nom_supplement,
            supplement.prix_supplement
        FROM supplement
        ORDER BY supplement.prix_supplement ASC;
    ";

    $result = $db->query($query);

    while ($row = $result->fetch_assoc()) {
        $items[] = [
            'id' => $row['id_supplement'],
            'nom' => $row['nom_supplement'],
            'prix' => $row['prix_supplement'],
        ];
    }

    return $items;
}
