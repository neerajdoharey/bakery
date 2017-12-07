# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
# create a customer for this coding challenge. No user or session management implemented.
Customer.create({
  name: "Neeraj Doharey",
  address: "Hello World",
})

# Products
Product.create({
  name: "Vegemite Scroll",
  code: "VS5",
  product_varients_attributes: [{
    quantity: 3,
    price: 6.99
  }, {
    quantity: 5,
    price: 8.99
  }]
})

Product.create({
  name: "Blueberry Muffin",
  code: "MB11",
  product_varients_attributes: [{
    quantity: 2,
    price: 9.95
  }, {
    quantity: 5,
    price: 16.95
  }, {
    quantity: 8,
    price: 24.95
  }]
})

Product.create({
  name: "Croissant",
  code: "CF",
  product_varients_attributes: [{
    quantity: 3,
    price: 5.95
  }, {
    quantity: 5,
    price: 9.95
  }, {
    quantity: 9,
    price: 16.99
  }]
})