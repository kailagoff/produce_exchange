class User < ActiveRecord::Base
  has_many :produces, dependent: :destroy
  has_and_belongs_to_many :events, dependent: :destroy
  validates(:name,  {:uniqueness => true, :presence => true, :length => {maximum: 20}})
  validates(:password, {:presence => true})
  validates(:email, {:presence => true, :uniqueness => true})

private
  def self.findbyname(searchname)
    @users = User.all
    @users.each() do |user|
      if user.name == searchname
        @user_id = user.id
      end
    end
    @user_id
  end

  def self.findtotrade(searchterm)
    @users = User.all
    @produces = Produce.all
    id_array = []
    @produces.each() do |produce|
      if produce.trade.include?(searchterm)
        id_array.push(produce.user_id)
      end
    end
    user_array = []
    @users.each() do |user|
      id_array.each do |id|
        if user.id == id
          user_array.push(user)
        end
      end
    end
    user_array
  end


end
