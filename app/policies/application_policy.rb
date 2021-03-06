class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  def dashboard?
    user && user.admin?
  end

  def index?
    user && user.admin?
  end

  def new?
    dashboard?
  end

  def export?
    dashboard?
  end

  def bulk_delete?
    dashboard?
  end

  def show?
    dashboard?
  end

  def edit?
    dashboard?
  end
  
  def delete?
    dashboard?
  end

  def show_in_app?
    dashboard?
  end

  def destroy?
    dashboard?

  end

end
