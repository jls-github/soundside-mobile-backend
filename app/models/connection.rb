class Connection < ApplicationRecord

    def self.serialized_connections
        Connection.order(date: :desc).map{|connection| {
            name: connection.name, 
            email: connection.email, 
            comment: connection.comment, 
            learn_about_jesus: 
            connection.learn_about_jesus, 
            hear_about_church: 
            connection.hear_about_church, 
            talk_to_pastor: connection.talk_to_pastor, 
            date: connection.date.date.strftime("%Y-%m-%d")
        }}
    end
    
end
