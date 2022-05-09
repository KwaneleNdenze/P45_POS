class PurchasePolicy < ApplicationPolicy
  attr_reader :current_user, :purchase

  def initialize(current_user, purchase)
    @current_user = current_user
    @purchase = purchase
  end

  def index?
    @current_user.manager?
  end

  def searchrange?
    @current_user.manager?
  end

  def show?
    @current_user.manager?
  end

  def edit?
    @current_user.manager?
  end

  def create?
    @current_user.cashier?
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