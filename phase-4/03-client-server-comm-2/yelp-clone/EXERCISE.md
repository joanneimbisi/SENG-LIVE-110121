# Lecture 2 exercise

Refer to this doc for validations: [Active Record Validations](https://guides.rubyonrails.org/active_record_validations.html)


1. [ ] Add the following validations to the models:

- Upon creation of a business object, a name and address must be present
- A new user should be created with a username and email present, both must be unique.
- A review must be created with content.

2. [ ] Create a current user method to associate objects created with a 'logged in' user:

```rb
inside ApplicationController

private

def current_user
  User.last
end
```
3. [ ] Define a route and controller method responsible for creating a new business. Reminder: Handle valid or invalid data in the controller method. 

example on how to handle valid or invalid data:

```rb
  if obj.save
    render json: obj, status: :created
  else
    render json: { error: obj.errors.full_messages }, status: :unprocessable_entity
  end
```

4. [ ] Define a route and controller method to create a new review. 
    - When a new review is created, the foreign key for a user and business must be present due to the requirements enforced by a `belongs_to` association. 
    - For this we can use the currently logged in user by invoking on the `current_user` hint: `current_user.reviews.create(...)` An associated `business_id` could be provided in a few different ways. Get creative and consider how this would be handled. Typically, a nested route would be set up to include the `business_id` for which the review is being submitted for, but we will not be handling it this way today. 
    - Reminder to handle valid or invalid data.

5. [ ] Run `rails s` and test the methods defined in the API such as:

- Create a new business succesfully. What is the response? 
- Create a failed new business. How can the unsuccessful attempt be further investigated? What steps can be taken?

# Lecture 3 Exercise 

Together as a group, implement the following features into the API, carefully thinking through each of the questions necessary to build out an update and delete feature for the Review model. 

1. [ ] Users can edit an existing review. Make sure that users can only edit the content attribute(hint: strong params). 

- What HTTP verb is required? 
- What is the associated REST route? 
- What controller and action is responsible for handling this request? 
- What should the strong params include?

To complete this exercise:
1. Create a new review associated with an existing user and business. This can be done in the seeds.rb file or in rails console.
2. Define a route in `config/routes.rb`
3. Add the controller action. 
4. Inside the controller action, make sure to first find the review that needs to be updated. Add control flow to ensure that if the review is not found, a correct response is generated, and if an update occurs, the review is serialized as a JSON response(before/rescues can be used as an alternative).

2. [ ] Users can delete an existing review. 

- What HTTP verb is required? 
- What is the associated REST route? 
- What controller and action is responsible for handling this request? 
- What should the strong params include?

To complete this exercise:
1. Define a route in `config/routes.rb`
2. Add the controller method. 
3. Inside the controller method, make sure to first find the review that needs to be deleted. Add control flow to ensure that if the review is not found, a correct response is generated. How should a successful delete be handled? Does this type of request require a reponse?
