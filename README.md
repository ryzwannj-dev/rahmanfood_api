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

### Nouvel ingrédient

- `/add_ingredient`
    - **Méthode** : `POST`
    - **Description** : Ajoute un nouvel ingrédient dans la base de données.
    - **Champs requis** :
        - `nom` (string) – le nom de l'ingrédient
        - `masse` (string ou numérique) – la masse de l'ingrédient
        - `id_type_ingredient` (string) – l’identifiant du type d’ingrédient (ex : `type_autre`)
    - **Réponse en cas de succès** :
    ```json
    {
      "message": "Ingrédient ajouté avec succès"
    }
    ```
    - **Commande de test (Windows)** :
    ```bash
    curl -X POST http://192.168.1.155/rahmanfood_api/add_ingredient ^
      -H "Content-Type: application/x-www-form-urlencoded" ^
      -d "nom=Semoule" ^
      -d "masse=150" ^
      -d "id_type_ingredient=type_autre"
    ```

---


### Nouvel supplément

- `/add_supplement`
    - **Méthode** : `POST`
    - **Description** : Ajoute un nouveau supplément dans la base de données.
    - **Champs requis** :
        - `nom` (string) – le nom du supplément
        - `prix` (numérique) – le prix du supplément
    - **Réponse en cas de succès** :
    ```json
    {
      "message": "Supplément ajouté avec succès",
      "id": "supp_661a9f4c21fc4"
    }
    ```
    - **Commande de test (Windows)** :
    ```bash
    curl -X POST http://192.168.1.155/rahmanfood_api/add_supplement ^
      -H "Content-Type: application/x-www-form-urlencoded" ^
      -d "nom=Semoule" ^
      -d "prix=1.20"
    ```

---


## Base URL

Tous les endpoints doivent être préfixés avec : `/rahmanfood_api`

Exemple d'utilisation : `/rahmanfood_api/get_all_burgers`