class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/test/) 
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]
    
    # GET/POST user request
#     elsif req.path.match(/users/)
#       if req.env["REQUEST_METHOD"] == "GET"
#           if req.path.split("/users").length == 0
#             users = User.all
#             return [200, {'Content-Type' => 'application/json'}, [users.to_json]]
#           end
#         end
#       if req.env["REQUEST_METHOD"] == "POST"
#         form_data = JSON.parse(req.body.read)
#         new_user = User.create(username: form_data["username"])
#         return [200, {'Content-Type' => 'application/json'}, [new_user.to_json]]
#       end

#     # GET/POST/PATCH/DELETE item request
#     elsif req.path.match(/wishes/)
#       if req.env["REQUEST_METHOD"] == "GET"
#           if req.path.split("/wishes").length == 0
#           wishes = Wish.all
#           return [200, {'Content-Type' => 'application/json'}, [wishes.to_json]]
#           end
#         end
#       if req.env["REQUEST_METHOD"] == "POST"
#         form_data = JSON.parse(req.body.read)
#         new_wish = Wish.create(title: form_data["title"], description: form_data["description"])
#         return [200, {'Content-Type' => 'application/json'}, [new_wish.to_json]]
#       end
#       if req.env["REQUEST_METHOD"] == "DELETE"
#         wishes = Wish.all.last.delete
#         return [200, {'Content-Type' => 'application/json'}, [wishes.to_json]]
#       end
#       # if req.env["REQUEST_METHOD"] == "PATCH"
#       #   wish = Wish.update
#       #   return [200, {'Content-Type' => 'application/json'}, [wish.to_json]]
#       # end

#     # GET/POST/PATCH/DELETE board request
#     elsif req.path.match(/boards/)
#       if req.env["REQUEST_METHOD"] == "GET"
#         if req.path.split("/boards").length == 0
#           boards = Board.all
#           return [200, {'Content-Type' => 'application/json'}, [boards.to_json]]
#         end
#       end
#       if req.env["REQUEST_METHOD"] == "POST"
#         form_data = JSON.parse(req.body.read)
#         new_board = Board.create(name: form_data["name"])
#         return [200, {'Content-Type' => 'application/json'}, [new_board.to_json]]
#       end
#       if req.env["REQUEST_METHOD"] == "DELETE"
#         boards = Board.all.last.delete
#         return [200, {'Content-Type' => 'application/json'}, [boards.to_json]]
#       end
#       if req.env["REQUEST_METHOD"] == "PATCH"
#         boards = Board.update
#         return [200, {'Content-Type' => 'application/json'}, [boards.to_json]]
#       end

#     else
#       return [400, {'Content-Type' => 'application/json'}, [ {:error => "Path Not Found"}.to_json]]
#     end
    
#     resp.finish
#   end
# end



    elsif req.path.match(/users/) && req.get?
      users = User.all.map do |user| {username: user.username}
      end
      return [200, { 'Content-Type' => 'application/json' }, [ users.to_json]] 
    # POST user request
    elsif req.path.match(/users/) && req.post?
      data = JSON.parse(req.body.read)
      userExists = User.find_by(username: data["username"])
      if userExists
        return [200, { 'Content-Type' => 'application/json' }, 
        [ {:error => "Username: #{userExists.username} already exists. Please try another username."}.to_json]]
      else    
        user = User.create(data)
        return [200, { 'Content-Type' => 'application/json' }, 
        [ { :data => {:message => "Sign-up Completed", :user => user}}.to_json]]
      end
    elsif req.path.match(/users/)
      name = req.params["q"]
      user = User.find_by(:name => name)
      return [200, { "Content-Type" => "application/json" }, [{:user => user, :userWishes => user.wishes, :userBoards => user.boards}.to_json]]

    elsif req.path.match(/wishes/) && req.get?
      wishes = Wish.all.map do |wish| {
        title: wish.title, 
        description: wish.description, 
        board_id: wish.board_id,
        user_id: wish.user_id
      }
      end
      return [200, { 'Content-Type' => 'application/json' }, [{:data => {:wish => wishes}}.to_json]]
    elsif req.path.match(/wishes/) && req.post?
      data = JSON.parse(req.body.read)
      wish = Wish.create(data)
        return [200, { 'Content-Type' => 'application/json' }, [{:data => {:message => "Wish created", :wish => wish}}.to_json]]
    elsif req.path.match(/items/) && req.put?
      wish = Wish.update(data)
        return [200, { 'Content-Type' => 'application/json' }, [{:data => {:message => "Wish updated", :wish => wish}}.to_json]]
    elsif req.delete?
      id = req.path.split("/courses/").last
      Wish.find(id).delete
        return [200, { 'Content-Type' => 'application/json' }, [ {:message => "Wish deleted!"}.to_json ]]

    elsif req.path.match(/boards/) && req.get?
      boards = Board.all.map do |board| {
        name: board.name, 
        wish_id: board.wish_id
      }
      end
      return [200, { 'Content-Type' => 'application/json' }, [ {:data => {:board => boards}}.to_json]]
    elsif req.path.match(/boards/) && req.post?
      data = JSON.parse(req.body.read)
      board = Board.create(data)
        return [200, { 'Content-Type' => 'application/json' }, [ {:data => {:message => "Board created", :board => board}}.to_json]]

    else
      return [400, {'Content-Type' => 'application/json'}, [ {:error => "Path Not Found"}.to_json]]
    end

    resp.finish
  end
end