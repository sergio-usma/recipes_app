# Create users
user1 = User.create!(
  name: "John Doe",
  email: "john.doe@example.com",
  password: "password",
  confirmed_at: Time.now
)

user2 = User.create!(
  name: "Jane Smith",
  email: "jane.smith@example.com",
  password: "password",
  confirmed_at: Time.now
)

user3 = User.create!(
  name: "Bob Johnson",
  email: "bob.johnson@example.com",
  password: "password",
  confirmed_at: Time.now
)

# Create foods for user1
food1_user1 = user1.foods.create!(name: 'Apple', measurement_unit: 'piece', price: 1, quantity: 10)
food2_user1 = user1.foods.create!(name: 'Banana', measurement_unit: 'piece', price: 2, quantity: 8)
food3_user1 = user1.foods.create!(name: 'Grapes', measurement_unit: 'bunch', price: 3, quantity: 5)
food4_user1 = user1.foods.create!(name: 'Strawberries', measurement_unit: 'pint', price: 4, quantity: 3)
food5_user1 = user1.foods.create!(name: 'Watermelon', measurement_unit: 'piece', price: 5, quantity: 1)

# Create foods for user2
food1_user2 = user2.foods.create!(name: 'Orange', measurement_unit: 'piece', price: 1, quantity: 12)
food2_user2 = user2.foods.create!(name: 'Carrot', measurement_unit: 'piece', price: 1, quantity: 15)
food3_user2 = user2.foods.create!(name: 'Broccoli', measurement_unit: 'head', price: 2, quantity: 7)
food4_user2 = user2.foods.create!(name: 'Cucumber', measurement_unit: 'piece', price: 1, quantity: 10)
food5_user2 = user2.foods.create!(name: 'Tomato', measurement_unit: 'piece', price: 1.5, quantity: 8)

# Create foods for user3
food1_user3 = user3.foods.create!(name: 'Pineapple', measurement_unit: 'piece', price: 3, quantity: 5)
food2_user3 = user3.foods.create!(name: 'Mango', measurement_unit: 'piece', price: 2.5, quantity: 6)
food3_user3 = user3.foods.create!(name: 'Peach', measurement_unit: 'piece', price: 2, quantity: 8)
food4_user3 = user3.foods.create!(name: 'Plum', measurement_unit: 'piece', price: 1.5, quantity: 10)
food5_user3 = user3.foods.create!(name: 'Cherry', measurement_unit: 'pint', price: 4, quantity: 4)

# Create recipe for user1
recipe1_user1 = user1.recipes.create!(
  name: 'Fruit Salad',
  preparation_time: 10,
  cooking_time: 5,
  description: 'Healthy fruit salad recipe.',
  public: true
)

recipe2_user1 = user1.recipes.create!(
  name: 'Banana Smoothie',
  preparation_time: 5,
  cooking_time: 2,
  description: 'Refreshing banana smoothie.',
  public: true
)

recipe3_user1 = user1.recipes.create!(
  name: 'Grapes and Cheese Platter',
  preparation_time: 15,
  cooking_time: 2,
  description: 'Simple and elegant grapes and cheese platter.',
  public: true
)

recipe4_user1 = user1.recipes.create!(
  name: 'Strawberry Shortcake',
  preparation_time: 20,
  cooking_time: 15,
  description: 'Classic strawberry shortcake dessert.',
  public: true
)

# Create recipe for user2
recipe1_user2 = user2.recipes.create!(
  name: 'Vegetable Stir Fry',
  preparation_time: 30,
  cooking_time: 20,
  description: 'Quick and delicious vegetable stir fry.',
  public: true
)

recipe2_user2 = user2.recipes.create!(
  name: 'Cucumber Salad',
  preparation_time: 15,
  cooking_time: 2,
  description: 'Refreshing cucumber salad.',
  public: true
)

recipe3_user2 = user2.recipes.create!(
  name: 'Tomato Basil Pasta',
  preparation_time: 20,
  cooking_time: 15,
  description: 'Classic pasta with fresh tomatoes and basil.',
  public: true
)

recipe4_user2 = user2.recipes.create!(
  name: 'Broccoli and Cheese Stuffed Potatoes',
  preparation_time: 25,
  cooking_time: 30,
  description: 'Baked potatoes stuffed with broccoli and cheese.',
  public: true
)

# Create recipe for user3
recipe1_user3 = user3.recipes.create!(
  name: 'Tropical Smoothie',
  preparation_time: 15,
  cooking_time: 5,
  description: 'Refreshing smoothie with tropical fruits.',
  public: true
)
recipe2_user3 = user3.recipes.create!(
  name: 'Peach Mango Salsa',
  preparation_time: 10,
  cooking_time: 2,
  description: 'Fresh salsa with peaches and mango.',
  public: true
)
recipe3_user3 = user3.recipes.create!(
  name: 'Grilled Pineapple Skewers',
  preparation_time: 20,
  cooking_time: 10,
  description: 'Delicious grilled pineapple skewers.',
  public: true
)
recipe4_user3 = user3.recipes.create!(
  name: 'Cherry Plum Sorbet',
  preparation_time: 30,
  cooking_time: 2,
  description: 'Homemade sorbet with cherry and plum flavors.',
  public: true
)


# Associate foods with user1's recipe
RecipeFood.create!(recipe: recipe1_user1, food: food1_user1, quantity: 2)
RecipeFood.create!(recipe: recipe1_user1, food: food2_user1, quantity: 3)
RecipeFood.create!(recipe: recipe1_user1, food: food3_user1, quantity: 1)
RecipeFood.create!(recipe: recipe1_user1, food: food4_user1, quantity: 3)
RecipeFood.create!(recipe: recipe1_user1, food: food5_user1, quantity: 1)

RecipeFood.create!(recipe: recipe2_user1, food: food2_user1, quantity: 2)
RecipeFood.create!(recipe: recipe2_user1, food: food5_user1, quantity: 1)

RecipeFood.create!(recipe: recipe3_user1, food: food3_user1, quantity: 2)
RecipeFood.create!(recipe: recipe3_user1, food: food4_user1, quantity: 2)

RecipeFood.create!(recipe: recipe4_user1, food: food4_user1, quantity: 3)
RecipeFood.create!(recipe: recipe4_user1, food: food5_user1, quantity: 2)

# Associate foods with user2's recipe
RecipeFood.create!(recipe: recipe1_user2, food: food1_user2, quantity: 2)
RecipeFood.create!(recipe: recipe1_user2, food: food2_user2, quantity: 3)
RecipeFood.create!(recipe: recipe1_user2, food: food3_user2, quantity: 4)
RecipeFood.create!(recipe: recipe1_user2, food: food4_user2, quantity: 2)
RecipeFood.create!(recipe: recipe1_user2, food: food5_user2, quantity: 1)

RecipeFood.create!(recipe: recipe2_user2, food: food4_user2, quantity: 3)
RecipeFood.create!(recipe: recipe2_user2, food: food5_user2, quantity: 2)

RecipeFood.create!(recipe: recipe3_user2, food: food5_user2, quantity: 3)

RecipeFood.create!(recipe: recipe4_user2, food: food3_user2, quantity: 4)
RecipeFood.create!(recipe: recipe4_user2, food: food5_user2, quantity: 2)

# Associate foods with user3's recipe
RecipeFood.create!(recipe: recipe1_user3, food: food1_user3, quantity: 3)
RecipeFood.create!(recipe: recipe1_user3, food: food2_user3, quantity: 2)
RecipeFood.create!(recipe: recipe1_user3, food: food3_user3, quantity: 5)
RecipeFood.create!(recipe: recipe1_user3, food: food4_user3, quantity: 1)
RecipeFood.create!(recipe: recipe1_user3, food: food5_user3, quantity: 3)

RecipeFood.create!(recipe: recipe2_user3, food: food1_user3, quantity: 2)
RecipeFood.create!(recipe: recipe2_user3, food: food2_user3, quantity: 1)
RecipeFood.create!(recipe: recipe2_user3, food: food3_user3, quantity: 3)

RecipeFood.create!(recipe: recipe3_user3, food: food1_user3, quantity: 4)
RecipeFood.create!(recipe: recipe3_user3, food: food2_user3, quantity: 3)
RecipeFood.create!(recipe: recipe3_user3, food: food3_user3, quantity: 2)

RecipeFood.create!(recipe: recipe4_user3, food: food4_user3, quantity: 4)
RecipeFood.create!(recipe: recipe4_user3, food: food5_user3, quantity: 2)

puts "Seed data created successfully!"