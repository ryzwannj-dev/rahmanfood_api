# Exemples de commandes curl pour tester l'API

## Modifier un ingrédient

```bash
# Modifier un ingrédient existant
curl -X POST http://localhost/rahmanfood_api/edit_ingredient \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "id=1" \
  -d "nom=Tomate" \
  -d "masse=50" \
  -d "id_type_ingredient=1"
```

Cette commande modifie un ingrédient avec :
- ID : 1
- Nouveau nom : Tomate
- Nouvelle masse : 50g
- Type d'ingrédient : 1

La réponse attendue sera au format JSON :
```json
{
    "message": "Ingrédient modifié avec succès",
    "id": "1"
}
```

En cas d'erreur, vous recevrez une réponse comme :
```json
{
    "error": "Champs requis manquants"
}
```