<?php
require_once __DIR__ . '/../database.php';
require_once __DIR__ . '/pizzas.php';
require_once __DIR__ . '/sandwichs.php';
require_once __DIR__ . '/burgers.php';
require_once __DIR__ . '/assiettes.php';
require_once __DIR__ . '/boissons_desserts.php';
require_once __DIR__ . '/texmex.php';
require_once __DIR__ . '/tacos.php';

function getAllProducts() {
    return array_merge(
        getPizzas(),
        getSandwichs(),
        getBurgers(),
        getTacos(),
        getTexMex(),
        getAssiettes(),
        getBoissons(),
        getDesserts()
    );
}