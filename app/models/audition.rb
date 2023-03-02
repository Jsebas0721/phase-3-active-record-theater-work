class Audition < ActiveRecord::Base

    belongs_to :role

    def role
        Role.all.find(self.id)
    end

    def call_back
        self.update(hired: true)
    end
  
end