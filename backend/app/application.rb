require 'pry'

class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/test/) 
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]
#<-----------USERS GET REQUEST------------->
    # elsif req.path.match(/users/) && req.get?
    #   users = User.all.map do |user| {username: user.username}
    #   end
    #   return [200, { 'Content-Type' => 'application/json' }, [ {:data => {:user => users}}.to_json]] 
#<-----------USERS POST REQUEST------------->
    elsif req.path.match(/users/) && req.post?
      data = JSON.parse(req.body.read)
      userExists = User.find_by(username: data["username"])
      if userExists
        return [200, { 'Content-Type' => 'application/json' }, 
        [ {:message => "Sign-in Completed"}.to_json]]
      else    
        User.create(username: data["username"])
        create_user = {username: data["username"]}
        return [200, { 'Content-Type' => 'application/json' }, 
        [ { :data => {:message => "Sign-in Completed", :user => create_user}}.to_json]]
      end
    elsif req.path.match(/users/)
      username = req.params['q']
      user = User.find_by(:username => username)
      return [200, { "Content-Type" => "application/json" }, [{:user => user, :userBoards => user.boards}.to_json]]
#<-----------BOARDS GET REQUEST------------->
    elsif req.path.match(/boards/) && req.get?
      boards = Board.all.map do |board| {id: board.id, name: board.name, user: board.user_id}
      end
      return [200, { 'Content-Type' => 'application/json' }, [ {:data => {:board => boards}}.to_json]]
#<-----------BOARDS POST REQUEST------------->
    elsif req.path.match(/boards/) && req.post?
      data = JSON.parse(req.body.read)
      username = User.find_by(username: data["username"])
      board = Board.create(name: data["name"], user_id: username.id)
      return [200, { 'Content-Type' => 'application/json' }, 
      [ {:board => board}.to_json]]
#<-----------BOARDS DELETE REQUEST------------->
    elsif req.delete?
      id = req.path.split("/boards/").last
      board = Board.find(id).delete
        return [200, { 'Content-Type' => 'application/json' }, [{:message => "Board deleted!", :board => board}.to_json ]]

# #<-----------WISHES GET REQUEST------------->
#     elsif req.path.match(/wishes/) && req.get?
#       wishes = Wish.all.map do |wish| {id: wish.id, title: wish.title, description: wish.description, user_id: wish.user_id, board_id: wish.board_id}
#       end
#       return [200, { 'Content-Type' => 'application/json' }, [ {:data => {:wish => wishes}}.to_json]]
# #<-----------WISHES POST REQUEST------------->
#     elsif req.path.match(/wishes/) && req.post?
#       data = JSON.parse(req.body.read)
#       wish = Wish.create(data)
#       create_wish = {id: wish.id, title: wish.title, description: wish.description, user_id: wish.user_id, board_id: wish.board_id}
#       return [200, { 'Content-Type' => 'application/json' }, 
#       [ { :data => {:message => "Wish created", :wish => create_wish}}.to_json]]

    else
      return [400, {'Content-Type' => 'application/json'}, [ {:error => "Path Not Found"}.to_json]]
    end

    resp.finish
  end
end