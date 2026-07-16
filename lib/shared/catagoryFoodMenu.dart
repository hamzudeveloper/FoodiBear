/// Centralized menu data for CategoryScreen navigation.
///
/// Previously this exact 10-item burger list was copy-pasted 5 times inside
/// HomeScreen (once per CategoryCard onTap), and every category (Deals,
/// Pizza, Chicken Pieces, Fries, Burgers) opened the *same* list regardless
/// of what was tapped. Now there's one source of truth per category.
library;

const List<Map<String, dynamic>> _burgerMenu = [
  {
    "name": "Classic Burger",
    "price": 8.99,
    "image":
        "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500",
  },
  {
    "name": "Cheese Burger",
    "price": 9.49,
    "image":
        "https://images.unsplash.com/photo-1609167830220-7164aa360951?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  },
  {
    "name": "Double Beef Burger",
    "price": 12.99,
    "image":
        "https://images.unsplash.com/photo-1572802419224-296b0aeee0d9?w=500",
  },
  {
    "name": "Chicken Burger",
    "price": 9.99,
    "image":
        "https://images.unsplash.com/photo-1606755962773-d324e0a13086?w=500",
  },
  {
    "name": "Crispy Chicken Burger",
    "price": 10.49,
    "image":
        "https://images.unsplash.com/photo-1610614819513-58e34989848b?w=500",
  },
  {
    "name": "BBQ Burger",
    "price": 11.99,
    "image":
        "https://images.unsplash.com/photo-1594212699903-ec8a3eca50f5?w=500",
  },
  {
    "name": "Bacon Burger",
    "price": 12.49,
    "image":
        "https://images.unsplash.com/photo-1586190848861-99aa4a171e90?w=500",
  },
  {
    "name": "Veggie Burger",
    "price": 8.49,
    "image":
        "https://images.unsplash.com/photo-1520072959219-c595dc870360?w=500",
  },
  {
    "name": "Mushroom Burger",
    "price": 10.99,
    "image":
        "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=500",
  },
  {
    "name": "Spicy Burger",
    "price": 9.99,
    "image":
        "https://images.unsplash.com/photo-1550317138-10000687a72b?w=500",
  },
];

/// Map a category title (matches the CategoryCard `title`) to its menu.
///
/// Right now every category points at the same burger menu, matching the
/// original behavior. When you have real per-category data (actual pizzas,
/// fries, etc.), just replace the value for that key with its own list —
/// nothing in HomeScreen needs to change.
const Map<String, List<Map<String, dynamic>>> categoryMenus = {
  "Deals": _burgerMenu,
  "Pizza": _burgerMenu,
  "Chicken Pieces": _burgerMenu,
  "Fries": _burgerMenu,
  "Burgers": _burgerMenu,
};