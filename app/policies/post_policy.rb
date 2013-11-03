class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def create?
    true
  end

  def index?
    true
  end

  def show?
    @post.user_id == @user.id
  end

  def update?
    @post.user_id == @user.id
  end
  
  def destroy?
    @post.user_id == @user.id
  end

end