class AddDefaultUser < ActiveRecord::Migration[5.2]
  def change
  end

  def data
    User.create!(:email => 'admin@db.in.tum.de', :password => 'admin123', :password_confirmation => 'admin123', :role => 'admin')
  end

  def rollback
    User.find_by(email: 'admin@db.in.tum.de').destroy
  end
end
