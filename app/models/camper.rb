class Camper < ApplicationRecord
    has_many :signups
    has_many :activities, through: :signups

    validates :name, presence: true
    validates :age, inclusion: 8..18
    # numericality: { greater_than_or_equal_to: 8, less_than_or_equal_to: 18}

    def to_json
        {
            id: self.id, 
            name: self.name, 
            age: self.age, 
            activities: self.activities.map do |activity|
                {
                    id: activity.id, 
                    name: activity.name, 
                    difficulty: activity.difficulty
                }
            end
        }
    end
end
