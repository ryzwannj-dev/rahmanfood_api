<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');

require_once 'database.php';
require_once 'controllers/burgers.php';
require_once 'controllers/texmex.php';
require_once 'controllers/pizzas.php';
require_once 'controllers/sandwichs.php';
require_once 'controllers/assiettes.php';
require_once 'controllers/boissons_desserts.php';
require_once 'controllers/tacos.php';
require_once 'controllers/all_products.php';
require_once 'controllers/ingredients.php';
require_once 'controllers/type_ingredients.php';
require_once 'controllers/add_supplement.php';
require_once 'controllers/add_supplement_gratine.php';
require_once 'controllers/add_boisson.php';
require_once 'controllers/add_dessert.php';
require_once 'controllers/all_ingredients.php';
require_once 'controllers/all_supplements.php';
require_once 'controllers/all_supplements_gratine.php';
require_once 'controllers/delete_ingredient.php';
require_once 'controllers/delete_supplement.php';
require_once 'controllers/delete_supplement_gratine.php';
require_once 'controllers/edit_supplement_gratine.php';
require_once 'controllers/edit_ingredients.php';

$database = new Database();
$db = $database->connect();
$GLOBALS['db'] = $db;

$request_uri = $_SERVER['REQUEST_URI'];
$request_path = parse_url($request_uri, PHP_URL_PATH);
$base_path = '/rahmanfood_api';
$path = trim(substr($request_path, strlen($base_path)), '/');

// Supprimer les paramètres de requête s'ils existent
if (($pos = strpos($path, '?')) !== false) {
    $path = substr($path, 0, $pos);
}

// Si le chemin est vide, renvoyer un message d'accueil
if (empty($path)) {
    echo json_encode(['message' => 'Bienvenue sur l\'API RahmanFood']);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $response = [];
    
    switch ($path) {
        case 'get_all_burgers':
            $response = getBurgers();
            break;
            
        case 'get_all_texmex':
            $response = getTexMex();
            break;

        case 'get_all_pizzas':
            $response = getPizzas();
            break;

        case 'get_all_sandwichs':
            $response = getSandwichs();
            break;

        case 'get_all_assiettes':
            $response = getAssiettes();
            break;

        case 'get_all_boissons':
            $response = getBoissons();
            break;

        case 'get_all_desserts':
            $response = getDesserts();
            break;

        case 'get_all_products':
            $response = getAllProducts();
            break;
            
        case 'get_all_tacos':
            $response = getTacos();
            break;
            
        case 'get_all_ingredients':
            $response = getAllIngredients();
            break;

        case 'get_all_types':
            $response = getAllType();
            break;
        
        case 'get_ingredients':
            $response = get_Ingredients();
            break;

        case 'get_all_supplements':
            $response = get_Supplements();
            break;
        
        case 'get_all_supplements_gratine':
            $response = get_Supplements_Gratine();
            break;
            
        default:
            http_response_code(404);
            $response = ['error' => 'Endpoint non trouvé'];
            break;
    }
    
    echo json_encode($response);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $response = [];

    // Switch sur le chemin de l'API (add_ingredient)
    switch ($path) {
        case 'delete_ingredient':
            $response = deleteIngredient();
            break;
        case 'add_ingredient':
            $response = addIngredient();
            break;
        case 'add_supplement':
            $response = addSupplement();
            break;
        case 'add_supplement_gratine':
            $response = addSupplementGratine();
            break;
        case 'add_boisson':
            $response = addBoisson();
            break;
        case 'add_dessert':
            $response = addDessert();
            break;
        case 'delete_supplement':
            $response = deleteSupplementById();
            break;
        case 'delete_supplement_gratine':
            $response = deleteSupplementGratineById();
            break;
        case 'edit_supplement_gratine':
            $response = editSupplementGratine();
            break;
        case 'edit_ingredient':
            $response = editIngredient();
            break;
    }

    // Répondre avec les résultats (en format JSON)
    echo json_encode($response);
}

$db->close();