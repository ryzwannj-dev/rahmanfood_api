<?php
require_once __DIR__ . '/../database.php';

function getAllType() {
    global $db;
    $type = [];

    $query = "SELECT DISTINCT i.id_type_ingredient, i.type_ingredient
              FROM type_ingredient i
              ORDER BY i.type_ingredient";

    $result = $db->query($query);

    while ($row = $result->fetch_assoc()) {
        $type[] = [
            'id' => $row['id_type_ingredient'],
            'type' => $row['type_ingredient'],
        ];
    }
    return $type;

}