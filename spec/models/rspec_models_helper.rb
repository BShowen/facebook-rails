module RspecModelsHelper

    # create a valid user
    def create_user(options = {})
        @user = User.create! name:  options[:name] || "foo bar", 
                                email: options[:email] || "foobar@example.com",
                                password: "password"
    end

    # create a valid post
    def new_post 
        create_user.posts.build title: "foo", body: "bar"
    end

    # create a valid comment
    def new_valid_comment(options = {})
        options[:post].comments.new( author_id: options[:comment_author].id, body: "wubba lubba dubb dubb" )
    end

end