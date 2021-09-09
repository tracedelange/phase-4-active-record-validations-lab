class Post < ApplicationRecord

    validates :title, presence: true 
    validates :content, length: { minimum: 250 } 
    validates :summary, length: { maximum: 250 } 
    validates :category, inclusion: {in: %w(Non-Fiction Fiction)}

    validate :clickbait_title

    def clickbait_title
        # if title.exclude?(["Won't Believe", "Secret", "Top", "Guess"])
        #     errors.add(:title, "Title is Certainly not clickbait-y enough")
        # end
        
        if ["Won't Believe", "Secret", "Top", "Guess"].any?(title)
            puts "Nice title."
        else
            errors.add(:title, "Title is Certainly not clickbait-y enough")
        end
            
    end

end

