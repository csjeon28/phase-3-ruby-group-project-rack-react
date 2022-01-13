# Phase Three Ruby/Rack Project: Wish Board (backend)

My React on Rack based backend application utilizes a Sqlite3 database using Active Record and a React JS frontend in 2 separate repositories. I've created a wish board where users can sign in and create boards and then create wishes to organize into boards, designed like chalkboards and sticky notes.

## Objective of Phase 3 Ruby/Rack Project:

1. Access a Sqlite3 database using Active Record.
2. You should have a minimum of two models with a one to many relationship.
3. You should build out a simple **React** frontend to give your user 3 of the 4
   CRUD abilities for at least one of your resources. For example, build out a
   todo list. A user should be able to create a new todo, see all todos,
   update a todo item, and delete a todo. Todos can be grouped into categories,
   so that a todo has many categories and categories have many todos.
4. Use good OO design patterns. You should have separate classes for your
   models.

Your backend and your frontend should be in two different repositories. Create a
new repository in a separate folder with a React app for your frontend using
[create-react-app][].

## Planning

Create User       =>     post "/users"

See all boards    =>     get "/boards"
Add boards        =>     post "/boards"
Delete boards  =>     

See all wishes     =>     get "/wishes"
Add wishes         =>     post "/wishes"  

### User Model
   -users can sign in and access boards
   -has_many :boards
   -has_many :wishes

   -User has many boards
   -User has many wishes


### Board Model
   -users can create and add boards
   -belongs_to :user
   -has_many :wishes

   -Board belongs to user
   -Board has many wishes


### Wish Model
   -users can add wishes and drag & drop to board
   -belongs_to :board
   -belongs_to :user

   -Wish belongs to user
   -Wish belongs to board

### Set up database

:user ----------- :wish ----------- :board
  :username        :title            :name  
  :timestamps      :description      :user_id 
                   :board_id         :timestamps
                   :user_id
                   :timestamps

### Project Screen Recording:
<a href="https://www.dropbox.com/s/9ushiwo2zg4a7p6/Phase%203%20Project%20Screen%20Recording.mov?dl=0" target="_blank">Project Demo</a>

### Frontend Repository:
<a href="https://github.com/csjeon28/wishboard-phase-3-frontend-react" target="_blank">Frontend GitHub</a>