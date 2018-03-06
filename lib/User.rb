class User < ActiveRecord::Base
  has_many(:produces)
  has_and_belongs_to_many(:events)
  validates(:name, {:presence => true, :uniqueness => true})
  validates(:password, {:presence => true})
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

end
