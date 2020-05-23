module RspecModelsHelper

    # new user. to save to the DB 
    # pass in save: true otherwise this method simply call User.new and doesnt save it. 
    def new_valid_user(options = {})
        if options[:save]
            @user = User.create! name:  options[:name] || "foo bar", 
                                    email: options[:email] || "foobar@example.com",
                                    password: "password"
        else
            @user = User.new name:  options[:name] || "foo bar", 
                                    email: options[:email] || "foobar@example.com",
                                    password: "password"
        end
    end

    # new post that is not saved in the DB
    # pass in a user with options[:user] so the post can be assigned to that user. 
    def new_valid_post(options = {})
        options[:user].posts.build title: "foo", body: "bar"
    end

    # new comment that is not saved in the DB
    def new_valid_comment(options = {})
        options[:post].comments.new( author_id: options[:comment_author].id, body: "wubba lubba dubb dubb" )
    end
end