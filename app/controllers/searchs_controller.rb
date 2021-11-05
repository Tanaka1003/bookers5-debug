class SearchsController < ApplicationController
  def search
    @model = params["model"]
    @method = params["method"]
    @content = params["content"]
    @records = search_for(@model, @content, @method)
  end
    
  private
  def search_for(model, content, method)
    if model == 'user'
      if method == 'perfect'
        User.where(name: content)
      elsif method == 'forward'
        User.where('name Like ?', '%'+content+'%')
      elsif method == 'backward'
        User.where('name Like ?', '%'+content+'%')
      else
        User.where('name Like ?', '%'+content+'%')
      end
    elsif model == 'book'
      if method == 'perfect'
        Book.where(title: content)
      elsif method == 'forward'
        Book.where('title Like ?', '%'+content+'%')
      elsif method =='backward'
        Book.where('title Like ?', '%'+content+'%')
      else
        Book.where('title Like ?', '%'+content+'%')
      end
    end
  end
end
