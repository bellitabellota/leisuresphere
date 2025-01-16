# LeisureSphere

This project is my realization of the [final project of TOP's Rails path](https://www.theodinproject.com/lessons/ruby-on-rails-rails-final-project).

For deployment [Koyeb](https://www.koyeb.com/) was used and the PostgreSQL database is run via [Neon](https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbDdMNk5EOWY2NDEtZ09sN21URDRGLTdXLTdQQXxBQ3Jtc0trdENiMnNYaWd4cXV2TzA1OHNIdlBpVGFCSjFfVDRueWNSQVJFeXUyUmhaM2RlWTdLbUF5Q0ctSmRpaE1XR3V3OTRHU0hGTkJ0aENWTDNSc3B1ZjJEcUpzT0o5NUpjNEFDa05EenZOXzIwMmVhLTJhTQ&q=https%3A%2F%2Fneon.tech%2F&v=X_R5kTjz-dE), so you can [try the app yourself](https://leisuresphere-19144872.koyeb.app/).

## Features
 - Log in / out
   - Authentication with Devise Gem
   - Authentication with Google Omniauth
 - Home / Feed
   - Overview of the current user's posts and the posts of his/her followees
   - Users can create text posts or image posts
 - Profile
   - After signing up, a profile is created automatically with either the Google image, Gravatar image or default image
   - The profile picture and other profile fields can be updated
   - On the profile page, in addition to managing their profile details, users see all their posts and they can update or delete them here.
 - Follow page
   - Users can follow others to see their posts on the Feed
 - Following page
   - Users see the other users they are following and can unfollow them
 - Likes
  - Posts can be liked/unliked
  - The total like count is displayed next to the like/unlike button
  - After liking/unliking a post users are redirected back to the post on the Feed or the profile page (depending on where they took their action).
 - Comment
   - Users can comment on posts and update or delete them on the feed or profile page.
     After completing one of those actions they are redirected back to the post on the Feed or the profile page (depending on where they took their action).

- Miscellaneous
  - After signing up users receive a Welcome email (as email provider [SendGrid](https://sendgrid.com/en-us) was used).
  - Image upload is realized via Active storage using [Amazon S3](https://aws.amazon.com/s3) for cloud storage.
  - Stimulus controller toggling the "post options" button on the profile page where users can update or delete their posts.
  - This application has 98.63% test coverage. The tests were implemented using RSpec, Capybara and FactoryBots.
 
  (Please note: Although some CSS was added to create an appealing appearance, no effort was made towards a responsive design as the focus was on applying my Rails knowledge and learning new aspects about Rails.)
  
## Screenshots
- Login:

  ![login](https://github.com/user-attachments/assets/2f745254-c657-42a6-a978-5bceb1cc9d76)

- Follow page:

  ![follow](https://github.com/user-attachments/assets/fe945a00-d716-4fec-addc-e378c030c0c1)

- Following page:

  ![your_followees](https://github.com/user-attachments/assets/0b3ebbb4-3cb7-47c9-8c63-cef0e7cf5317)


- Home with the Feed (showing the posts of the current user and his/her followees):

  ![feed_top](https://github.com/user-attachments/assets/74a3fce2-ce2b-4b87-9cc4-d6df10bdd47a)

  ![feed_bottom](https://github.com/user-attachments/assets/5f73c2de-81b8-438b-b3b1-d721bb13a25a)

- Profile page:
  
  ![profile_top](https://github.com/user-attachments/assets/97eebeb6-ffc3-44e9-9b95-d7a5371af018)

- Live demo:
  
<video width="600" controls autoplay>
 <source src="https://github.com/user-attachments/assets/c35baed0-b623-40f0-8d2f-a43c6c74e1cd" type="video/mp4">
</video>


  ## Models and Associations

  ![the_models](https://github.com/user-attachments/assets/2b87d1cc-a276-4dfe-93da-cc69a5f585e8)
