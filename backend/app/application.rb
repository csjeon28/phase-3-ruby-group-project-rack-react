class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/test/) 
      return [200, { 'Content-Type' => 'application/json' }, 
      [ {:message => "test response!"}.to_json ]]
    # GET user request
    elsif req.path.match(/users/) && req.get?
      users = User.all.map do |user| {username: user.username}
      end
      return [200, { 'Content-Type' => 'application/json' }, 
        [ {:users => users}.to_json]] 
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
        [ {:data => {:message => "Sign-up Completed", :username => user}}.to_json]]
      end
    # GET item request
    elsif req.path.match(/items/) && req.get?
      items = Item.all.map do |item| {
        title: item.title, 
        description: item.description, 
        image: item.image_url,
        price: item.price,
        board: item.board_id
      }
      end
      return [200, { 'Content-Type' => 'application/json' }, 
        [ {:items => items}.to_json]]
    # POST item request
    elsif req.path.match(/items/) && req.post?
      data = JSON.parse(req.body.read)
      item = User.create(data)
        return [200, { 'Content-Type' => 'application/json' }, 
        [ {:data => {:items => item}}.to_json]]
    # GET board request
    elsif req.path.match(/boards/) && req.get?
      boards = Board.all.map do |board| {
        title: board.title, 
        description: board.description, 
        user_id: board.user_id,
        item_id: board.item_id,
      }
      end
      return [200, { 'Content-Type' => 'application/json' }, 
        [ {:boards => boards}.to_json]]
    # POST board request
    elsif req.path.match(/boards/) && req.post?
      data = JSON.parse(req.body.read)
      board = User.create(data)
        return [200, { 'Content-Type' => 'application/json' }, 
        [ {:data => {:boards => boards}}.to_json]]

    else
      return [400, {'Content-Type' => 'application/json'}, [ {:error => "Path Not Found"}.to_json]]
    end

    resp.finish
  end

end
