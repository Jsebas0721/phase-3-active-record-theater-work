class Role < ActiveRecord::Base
    has_many :auditions
  
    def auditions
        Audition.all.map do |aud|
            if self.id == aud.role_id
                aud
            end
        end
    end

    def actors
        Audition.all.map do |aud|
            if self.id == aud.role_id
                aud.actor_name
            end
        end
    end

    def location
        Audition.all.map do |aud|
            if self.id == aud.role_id
                aud.location
            end
        end
    end

    def lead
        is_hired = Audition.all.map do |aud|
            if self.id == aud.role_id
                if aud.hired
                    aud
                end

            end
        end.first
        
        if is_hired == []
            "no actor has been hired for understudy for this role"
        end
       
    end
end