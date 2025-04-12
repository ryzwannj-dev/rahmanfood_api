# API RahmanFood

Bienvenue sur la documentation de l'API RahmanFood. Cette API permet d'accéder aux différents produits disponibles dans notre menu.

## Endpoints

Tous les endpoints utilisent la méthode `GET` et retournent les données au format JSON.

### Produits

- `/get_all_products`
    - Description : Récupère tous les produits disponibles dans le menu
    - Réponse : Liste de tous les produits toutes catégories confondues
    - Exemple de réponse :
    ```json
    [
      {
        "id": 1,
        "nom": "Classic Burger",
        "prix": 8.50,
        "ingredients": ["Pain", "Steak haché", "Salade", "Tomate", "Oignon"],
        "categorie": "Burgers"
      },
      {
        "id": 1,
        "nom": "Margherita",
        "prix": 10.90,
        "ingredients": ["Sauce tomate", "Mozzarella", "Basilic"],
        "categorie": "Pizzas"
      }
    ]
    ```

### Burgers

- `/get_all_burgers`
    - Description : Récupère la liste des burgers
    - Réponse : Liste des burgers disponibles
    - Exemple de réponse :
    ```json
    [
      {
        "id": 1,
        "nom": "Classic Burger",
        "prix": 8.50,
        "ingredients": ["Pain", "Steak haché", "Salade", "Tomate", "Oignon"],
        "categorie": "Burgers"
      }
    ]
    ```

### Tacos

- `/get_all_tacos`
  - Description : Récupère la liste des tacos
  - Réponse : Liste des tacos disponibles

### Tex-Mex

- `/get_all_texmex`
    - Description : Récupère la liste des plats Tex-Mex
    - Réponse : Liste des plats Tex-Mex disponibles
    - Exemple de réponse :
    ```json
    [
      {
        "id": 1,
        "nom": "Nachos Supreme",
        "prix": 9.90,
        "ingredients": ["Tortillas", "Fromage", "Viande hachée", "Guacamole", "Sauce salsa"],
        "categorie": "Tex-Mex"
      }
    ]
    ```

### Pizzas

- `/get_all_pizzas`
    - Description : Récupère la liste des pizzas
    - Réponse : Liste des pizzas disponibles
    - Exemple de réponse :
    ```json
    [
      {
        "id": 1,
        "nom": "Margherita",
        "prix": 10.90,
        "ingredients": ["Sauce tomate", "Mozzarella", "Basilic"],
        "categorie": "Pizzas"
      }
    ]
    ```

### Sandwichs

- `/get_all_sandwichs`
    - Description : Récupère la liste des sandwichs
    - Réponse : Liste des sandwichs disponibles
    - Exemple de réponse :
    ```json
    [
      {
        "id": 1,
        "nom": "Club Sandwich",
        "prix": 7.50,
        "ingredients": ["Pain de mie", "Poulet", "Salade", "Tomate", "Mayonnaise"],
        "categorie": "Sandwichs"
      }
    ]
    ```

### Assiettes

- `/get_all_assiettes`
    - Description : Récupère la liste des assiettes
    - Réponse : Liste des assiettes disponibles
    - Exemple de réponse :
    ```json
    [
      {
        "id": 1,
        "nom": "Assiette Kebab",
        "prix": 12.90,
        "ingredients": ["Viande kebab", "Frites", "Salade", "Sauce"],
        "categorie": "Assiettes"
      }
    ]
    ```

### Boissons

- `/get_all_boissons`
    - Description : Récupère la liste des boissons
    - Réponse : Liste des boissons disponibles
    - Exemple de réponse :
    ```json
    [
      {
        "id": 1,
        "nom": "Coca-Cola",
        "prix": 2.50,
        "ingredients": [],
        "categorie": "Boissons"
      }
    ]
    ```

### Desserts

- `/get_all_desserts`
    - Description : Récupère la liste des desserts
    - Réponse : Liste des desserts disponibles
    - Exemple de réponse :
    ```json
    [
      {
        "id": 1,
        "nom": "Tiramisu",
        "prix": 4.50,
        "ingredients": [],
        "categorie": "Desserts"
      }
    ]
    ```

## Base URL

Tous les endpoints doivent être préfixés avec : `/rahmanfood_api`

Exemple d'utilisation : `/rahmanfood_api/get_all_burgers`