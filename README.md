armaSearch
==========

##Users



>User can register and log in to see content specific to the user.



####OpenID

OpenID and OAuth 2.0, i.e. Google Account will generate a user in the database using the details from Google Account automatically.

##Devise

##Models

* Projects
* Drawings
* Parts
* Links
* Users

####Project

* id: 
* number: number in format YY## (4th project in 2013 is 1304)
* owner: user_id
* title: string
* description: string
* date_created: date-time
* keywords: string of keywords separated by comma
* client: string
* architect: string
* designer: string
* date_completed: date

####Drawing

* id:
* number: string
* project_id: project.number
* title
* series
* revision
* drawn_by

####Part

* id
* number: string
* drawing_id: foreign key
* assembly: part_id

##User Stories

* User can create Projects

* A Project is a Building or part of a building depending on scope of work.
* A Project has many Drawings
* A Project has many Parts


* A Part is an identifiable object to be fabricated/produced.
* A Part may contain many Parts, i.e. an Assembly
* A Part has one drawing.


* A Drawing is a document to describe the project
* A Drawing links to many drawings
* A Drawing has one parent drawing
* All Drawings are linked by relationships using the drawing Number.

##Set up GEMFILE

    simple_form
    devise
    bootstrap


##RESOURCES

Devise - Cancan - Role Model: 
[Phase2Technology.com](http://www.phase2technology.com/blog/authentication-permissions-and-roles-in-rails-with-devise-cancan-and-role-model/)

Drag-n-Drop: [dannemanne.com](http://dannemanne.com/posts/drag-n-drop_upload_that_works_with_ror_and_paperclip)

Rails paperclip drag and drop multiple files: [StackOverflow](http://stackoverflow.com/questions/15703594/rails-paperclip-drag-and-drop-multiple-files)

##Reference

http://railscasts.com/episodes/304-omniauth-identity?view=asciicast