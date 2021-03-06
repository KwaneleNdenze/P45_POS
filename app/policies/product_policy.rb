class ProductPolicy < ApplicationPolicy
  attr_reader :current_user, :product

  def initialize(current_user, product)
    @current_user = current_user
    @product = product
  end

  def index?
    @current_user.manager?
  end

  def show?
    @current_user.manager?
  end

  def edit?
    @current_user.manager?
  end

  def create?
    @current_user.manager?
  end
 
  def update?
    @current_user.manager?
  end
 
  def destroy?
    @current_user.manager?
  end
 
  private
 
    def product
      record
    end

end