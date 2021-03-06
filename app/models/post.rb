class Post < ActiveRecord::Base
    
    # (this is where you associations are e.g. has_many :posts, etc.)...
    
    belongs_to :user
    has_many :comments
    has_many :likes
    
    # validations in between association definiations and methods!
    
    validates_presence_of :photo_url, :user
    
    # (this is where your def humanized_time_ago method is, along with the rest of your methods in this file)...
        
    def humanized_time_ago
        time_ago_in_seconds = Time.now - self.created_at
        time_ago_in_minutes = time_ago_in_seconds / 60
        
        # if created_at != Date.today.year #=> not in current year
        #    "#{(created_at).strftime("%B %d, %Y")}" #=> 
        #els
        if time_ago_in_minutes >= (60*24*7) #=> 60 minutes * 24 hours * 7 days
            "#{(time_ago_in_minutes / (60*24*7)).to_i} weeks ago"
        elsif time_ago_in_minutes >= (60*24) #=> 60 minutes * 24 hours
            "#{(time_ago_in_minutes / 1440).to_i} days ago"
        elsif time_ago_in_minutes >= 60
            "#{(time_ago_in_minutes / 60).to_i} hours ago" 
        else
            "#{time_ago_in_minutes.to_i} minutes ago"
        end
    end
    
    def like_count
        self.likes.size
    end
    
    def comment_count
        self.comments.size
    end
    
end