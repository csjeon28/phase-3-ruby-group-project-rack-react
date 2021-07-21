# Phase 3 Project

### User Stories
Create User       =>     post "/users"
Edit User         =>     update "/users/:id"

See all boards    =>     get "/boards"
Add boards        =>     post "/boards"
Edit boards       =>     update "/boards/:id"
Delete groceries  =>     

See all items     =>     get "/items"
Add items         =>     post "/items"
Edit items        =>     update "/items/:id"
Delete groceries  =>     

### User Model
   -users can sign up
   -users can login with username and password
   -has_many :boards
   -has_many :items, through :boards

### Board Model
   -users can create boards
   -belongs_to :user
   -has_many :items

### Item Model
   -create all items in seeds file
   -users can view all items
   -users can add/edit/delete items
   -belongs_to :board
   -belongs_to :item

### Set up
:user ---------< :board >---------- :item
  :username        :user_id           :name
  :password        :item_id           :price
  :timestamps      :timestamps   