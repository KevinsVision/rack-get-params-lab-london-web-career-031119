class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end
    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
<<<<<<< HEAD
    elsif req.path.match(/cart/)
      if @@cart.empty?
          resp.write "Your cart is empty"
        else
          req.path.match(/cart/)
            @@cart.each do |cart|
          resp.write "#{cart}\n"
          end
      end
      elsif req.path.match(/add/)
        add_item = req.params["item"]
        if @@items.include? add_item
          @@cart << add_item
          resp.write "added #{add_item}"
        else
          resp.write "We don't have that item"
        end
    else
      resp.write "Path Not Found"
    end
=======
    end
      
      
    if req.path.match(/cart/)
        if @@cart.size == 0
        resp.write "Your cart is empty"
      else 
      @@cart.each do |item|
        resp.write "#{item}\n"
      end
      end
    end
      
    if req.path.match(/add/)
      search_term = req.params["item"]
      resp.write handle_add(search_term)
    end
    

      
>>>>>>> 842619cea3ad743c35250a1225b5adbc87c916ea
    resp.finish
  end
  
def handle_add(search_term)
    if @@items.include?(search_term)
      @@cart << search_term
      resp.write "#{@@cart}\n"
    else
      return "We don't have that item"
    end
  end 

  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
<<<<<<< HEAD
  end
=======
  end 
>>>>>>> 842619cea3ad743c35250a1225b5adbc87c916ea
end