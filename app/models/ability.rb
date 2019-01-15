class Ability
  include CanCan::Ability

  def initialize(user, params)
    @user = user || User.new # guest user (not logged in)
    @params = params
    
    super_admin_abilities
    admin_abilities
    trappe_store_manager_abilites
    cambridge_store_manager_abilites
    easton_bypass_store_manager_abilites
    dover_rd_store_manager_abilites
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
# => Store
# => Product
# => PrepcenterProduct
# => StoreGood  
# => Location
# => Inventory
# => Order
# => Distributor
# => Price
# => QuickProduct
# => SavedPrice
# => User
  end

  def super_admin_abilities
    return unless @user.super_admin?
    can :manage, :all
  end

  def admin_abilities
    return unless @user.admin?
    can [:edit, :update], :registration
    can [:index], Store
    can :manage, [Inventory, Order]
  end

  def trappe_store_manager_abilites 
    return unless @user.trappe?
    can [:edit, :update], :registration
    can [:index], Store
    
    if @params == 'trappe'
      can :manage, [Inventory, Order]
    end

  end

  def cambridge_store_manager_abilites 
    return unless @user.cambridge?
    can [:edit, :update], :registration
    can [:index], Store

    if @params == 'cambridge'
      can :manage, [Inventory, Order]
    end    
  end
  
  def easton_bypass_store_manager_abilites 
    return unless @user.easton_bypass?
    can [:edit, :update], :registration
    can [:index], Store
    if @params == 'easton_bypass'
      can :manage, [Inventory, Order]
    end    
  end

  def dover_rd_store_manager_abilites 
    return unless @user.dover_rd?
    can [:edit, :update], :registration
    can [:index], Store
    if @params == 'dover_rd'
      can :manage, [Inventory, Order]
    end    
  end




end
