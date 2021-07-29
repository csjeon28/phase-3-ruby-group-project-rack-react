class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/test/) 
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]
    
    # GET/POST/DELETE user request
    elsif req.path.match(/users/) && req.get?
      users = User.all.map do |user| {username: user.username}
      end
      return [200, { 'Content-Type' => 'application/json' }, [ users.to_json]] 
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
    
      # GET/POST/PUT/DELETE wish request
    elsif req.path.match(/wishes/) && req.get?
      wishes = Wish.all.map do |wish| {title: wish.title, description: wish.description}
      end
      return [200, { 'Content-Type' => 'application/json' }, [wishes.to_json]]
    elsif req.path.match(/wishes/) && req.post?
      data = JSON.parse(req.body.read)
      wish = Wish.create(data)
        return [200, { 'Content-Type' => 'application/json' }, [{:data => {:message => "Wish created", :wish => wish}}.to_json]]
    elsif req.path.match(/wishes/) && req.put?
      wish = Wish.update(data)
        return [200, { 'Content-Type' => 'application/json' }, [{:data => {:message => "Wish updated", :wish => wish}}.to_json]]
    # elsif req.delete?
    elsif req.path.match(/wishes/) && req.delete?
      id = req.path.split("/wishes/").last
      wish = Wish.find(id).delete
        return [200, { 'Content-Type' => 'application/json' }, [{:data => {:message => "Wish deleted!", :wish => wish}}.to_json ]]

     # GET/POST/DELETE board request
    elsif req.path.match(/boards/) && req.get?
      boards = Board.all.map do |board| {name: board.name}
      end
      return [200, { 'Content-Type' => 'application/json' }, [ boards.to_json]]
    elsif req.path.match(/boards/) && req.post?
      data = JSON.parse(req.body.read)
      board = Board.create(data)
        return [200, { 'Content-Type' => 'application/json' }, [ {:data => {:message => "Board created", :board => board}}.to_json]]
    elsif req.path.match(/boards/) && req.delete?
      id = req.path.split("/boards/").last
      board = Board.find(id).delete
        return [200, { 'Content-Type' => 'application/json' }, [{:data => {:message => "Board deleted!", :board => board}}.to_json ]]

    else
      return [400, {'Content-Type' => 'application/json'}, [ {:error => "Path Not Found"}.to_json]]
    end

    resp.finish
  end
end