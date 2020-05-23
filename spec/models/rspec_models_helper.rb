module RspecModelsHelper

    # create a valid user
    def create_user
        @user = User.create name: "foo bar", 
                                email: "foobar@example.com",
                                password: "password"
    end

    # create a valid post
    def new_post 
        create_user.posts.build title: "foo", body: "bar"
    end

end