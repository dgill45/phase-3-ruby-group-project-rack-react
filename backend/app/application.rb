class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    # MEMBER ROUTES

    # member index route
    
    if req.path == ('/members') && req.get?
      return [200, { 'Content-Type' => 'application/json' }, [ Member.all.to_json ]]
    end
    
    #member create

    if req.path == ('/members') && req.post?
      body = JSON.parse(req.body.read)
      member = Member.create(body)
      return [201, { 'Content-Type' => 'application/json' }, [ member.to_json ]]
    end
    
    #member show route

    if req.path.match('/members/') && req.get?
      id = req.path.split('/')[2]
      begin
          member = Member.find(id)
          return [200, { 'Content-Type' => 'application/json' }, [member.to_json]]
      rescue Exception => e
            logger.error e.message
            e.backtrace.each { |line| logger.error line }
      end

    end
        
    # member update route

    if req.path.match('/members/') && req.patch?
      id = req.path.split('/')[2]
      body = JSON.parse(req.body.read)
      begin
          member = Member.find(id)
          member.update(body)
          return [202, { 'Content-Type' => 'application/json' }, [member.to_json]]
      rescue Exception => e
        logger.error e.message
        e.backtrace.each { |line| logger.error line }
      end
    end
    
    #member delete

    if req.path.match('/members/') && req.delete?
      id = req.path.split('/')[2]
      begin
          member = Member.find(id)
          member.destroy
          return [200, { 'Content-Type' => 'application/json' }, [{message: "Member removed."}.to_json]]
      rescue Exception => e
        logger.error e.message
        e.backtrace.each { |line| logger.error line }
      end

    end
        
        
    # COMMENT ROUTES

    # Comment index

    if req.path == ('/comments') && req.get?
      return [200, { 'Content-Type' => 'application/json' }, [ Comment.all.to_json ]]
    end

    # Comment create

    if req.path == ('/comments') && req.post?
      body = JSON.parse(req.body.read)
      comment = Comment.create(body)
      return [201, { 'Content-Type' => 'application/json' }, [ comment.to_json ]]
    end
    
    # Comment show 

    if req.path.match('/comments/') && req.get?
      id = req.path.split('/')[2]
      begin
          comment = Comment.find(id)
          return [200, { 'Content-Type' => 'application/json' }, [comment.to_json]]
      rescue Exception => e
        logger.error e.message
        e.backtrace.each { |line| logger.error line }
      end
    end

    # Comment update

    if req.path.match('/comments/') && req.patch?
      id = req.path.split('/')[2]
      body = JSON.parse(req.body.read)
      begin
          comment = Comment.find(id)
          comment.update(body)
          return [202, { 'Content-Type' => 'application/json' }, [comment.to_json]]
      rescue Exception => e
        logger.error e.message
        e.backtrace.each { |line| logger.error line }
      end
    end

    #Comment destroy

    if req.path.match('/comment/') && req.delete?
      id = req.path.split('/')[2]
      begin
          comment = Comment.find(id)
          comment.destroy
          return [200, { 'Content-Type' => 'application/json' }, [{message: "Comment removed."}.to_json]]
      rescue Exception => e
        logger.error e.message
        e.backtrace.each { |line| logger.error line }
      end
    end
    
    #BOOK ROUTES

    #book index

    if req.path == ('/books') && req.get?
      return [200, { 'Content-Type' => 'application/json' }, [ Book.all.to_json ]]
    end

    #book create

    if req.path == ('/books') && req.post?
      body = JSON.parse(req.body.read)
      book = Book.create(body)
      return [201, { 'Content-Type' => 'application/json' }, [ book.to_json ]]
    end

    #book show

    if req.path.match('/books/') && req.get?
      id = req.path.split('/')[2]
      begin
          book = Book.find(id)
          return [200, { 'Content-Type' => 'application/json' }, [book.to_json]]
      rescue Exception => e
        logger.error e.message
        e.backtrace.each { |line| logger.error line }
      end

    end

    #book update

    if req.path.match('/books/') && req.patch?
      id = req.path.split('/')[2]
      body = JSON.parse(req.body.read)
      begin
          book = Book.find(id)
          book.update(body)
          return [202, { 'Content-Type' => 'application/json' }, [book.to_json]]
      rescue Exception => e
        logger.error e.message
        e.backtrace.each { |line| logger.error line }
      end
    end

    #book delete

if req.path.match('/books/') && req.delete?
      id = req.path.split('/')[2]
      begin
          book = Book.find(id)
          book.destroy
          return [200, { 'Content-Type' => 'application/json' }, [{message: "Book removed."}.to_json]]
      rescue Exception => e
        logger.error e.message
        e.backtrace.each { |line| logger.error line }
      end
    end



    if req.path.match(/test/) 
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]

    else
      resp.write "Path Not Found"

    end

    resp.finish
  end

end
