# TO-DO

# Models
* ## User
    #### Associations
    * ~~has one profile~~
    * ~~has many posts~~
    * ~~has many comments~~
    * has many friends
    * has a feed
        * implemented as a method on a user so we can call `@user.feed` to return a list of recent posts to an authenticated user. `authenitcated_user == current_friend`
    * ~~has many likes~~
        * so we can click on a post to see a list of users who like that post
    * ~~has many friend_requests~~
        * ~~has many friend_requests_sent~~
        * ~~has many friend_requests_recevied~~
    #### Validates 
    * ~~name~~
    * ~~email~~
    * ~~password~~
    * ~~profile~~
* ## Post
    #### Associations
    * ~~belongs to a user~~
    * ~~has many comments~~
    * ~~has many likes~~
    #### Validates
    * ~~has a title~~
    * ~~has a body~~
    * ~~has an author~~
* ## Comment
    #### Associations
    * ~~belongs to a user~~ -> so we can see comments on a post with `@comment.author.name` etc. 
    * ~~belongs to a post~~
    #### Validates
    * ~~has an author~~
    * ~~has a post (that it's commenting on)~~
    * ~~has a body~~
* ## Like (so a user can like someones post)
    #### Associations
    * ~~belongs to a user~~
    * ~~belongs to a post~~
    #### validates
    * post
    * author 
* ## Profile
    #### Associations
    * ~~belongs to a user~~

# Features
* friending 
    * have pending friend request  
        * implimented by having it's own table with two id's: `request_sender_id` and `request_receiver_id`.
    * have current friends 
* authentication
    * session handling with devise 
    * authenticate with Omniauth to allow login with Facebook credentials 

## Site
* basic nav bar
    * login
    * logout
    * users
        * click a user to view their profile 
            * if you're friends you can view there bio, feed, etc. 
            * if you're not a friend all you see if their picture and friend request button
    * friends
        * list all of your current friends
    * posts
        * list all of your postings

## TO-DO
*  fix indentation in Posts spec
* set dependent destroy on post comments (check other relationships as well) 
    