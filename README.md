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
* has_part: boolean
* drawn_by

####Part

* id
* number: string
* drawing_id: foreign key
* assembly: part_id

##User Stories

* User can create Projects

* A Project is a Building or part of a building depending on scope of work.
* A Project has one user_id which is the owner
* A Project can be shared with 
* A Project has many Drawings
* A Project has many Parts

* A Drawing is a document to describe the project
* A Drawing always have an attachment. PDF.
* A Drawing links to many other drawings
* A Drawing has one parent drawing
* All Drawings are linked by relationships using the drawing Number.

* A Part is an identifiable object to be fabricated/produced.
* A Part may contain many Parts, i.e. an Assembly
* A Part has one drawing.

##Set up GEMFILE

    simple_form
    devise
    bootstrap
	friendly_id
    settingslogic
    cancan
    

##Validation

###Project creation

Projects can only be created once signed in.



###Drawing Creation

Only created once uploaded a PDF file.


###Part Creation

Only created once a drawing is created with a has_part value is True.




###Automation - company specific

* Projects number is autogenerated by the year that the project is created.

* year is automatically filled with current year

##RESOURCES

Devise - Cancan - Role Model: 
[Phase2Technology.com](http://www.phase2technology.com/blog/authentication-permissions-and-roles-in-rails-with-devise-cancan-and-role-model/)

Drag-n-Drop: [dannemanne.com](http://dannemanne.com/posts/drag-n-drop_upload_that_works_with_ror_and_paperclip)

Rails paperclip drag and drop multiple files: [StackOverflow](http://stackoverflow.com/questions/15703594/rails-paperclip-drag-and-drop-multiple-files)

Add sensitive credential information to local computer [StackOverflow](http://stackoverflow.com/questions/11760597/s3-paperclip-working-on-heroku-but-not-localhost)

Add associations to models [Ruby On Rails](http://guides.rubyonrails.org/association_basics.html)

Edit .bash_profile to store sensitive data for rails app: [refinsolutions.com](http://redfinsolutions.com/blog/creating-bashprofile-your-mac)

Friendly Urls: [railscasts](http://railscasts.com/episodes/314-pretty-urls-with-friendlyid?view=asciicast)

Simple explanation the difference between `has_One` vs `belongs_to`: [StackOverflow](http://stackoverflow.com/questions/3808926/whats-the-difference-between-belongs-to-and-has-one)

More about `has_one` vs `belongs_to` : [requiremind.com](http://requiremind.com/differences-between-has-one-and-belongs-to-in-ruby-on-rails/)

Solve PermanentRecord error for AWS S3: [StackOverflow](http://stackoverflow.com/questions/13894014/development-error-using-paperclip-and-amazon-s3)

##Reference

http://railscasts.com/episodes/304-omniauth-identity?view=asciicast