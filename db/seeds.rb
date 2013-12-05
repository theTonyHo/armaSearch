# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seeding Users
#User.create(id: integer, email: string, encrypted_password: string, reset_password_token: string, reset_password_sent_at: datetime, remember_created_at: datetime, sign_in_count: integer, current_sign_in_at: datetime, last_sign_in_at: datetime, current_sign_in_ip: string, last_sign_in_ip: string, created_at: datetime, updated_at: datetime)

existing_users = User.all

if existing_users.count == 0

  new_users = []
  new_users << {:email => "tho@email.com", :password => "password"} 
  new_users << {:email => "john.doe@email.com", :password => "password"} 
  new_users << {:email => "liz.taylor@email.com", :password => "password"} 
  new_users << {:email => "austin.beiber@email.com", :password => "password"} 
  new_users << {:email => "amanda.twinkle@email.com", :password => "password"} 
  new_users << {:email => "mad.hatter@email.com", :password => "password"} 

  new_users.each do |new_user_hash|
    u = User.new(new_user_hash)
      u.save!(:validate => false)
        puts "Created User #{u.email} with id #{u.id}"
  end

end



# Seeding Projects
#Project.create(id: integer, name: string, created_at: datetime, updated_at: datetime, owner_id: integer, number: integer, description: string, client: string, architect: string, designer: string, date_completed: string, status: string, user_id: integer, slug: string) 
#Project.create(id: integer, created_at: datetime, updated_at: datetime, name: string, owner_id: integer, title: string, description: text, client: string, architect: string, designer: string, date_completed: string, status: string, user_id: integer, slug: string) 

  new_projects = []
  new_projects << {:name => "1105_AAA_Flowers", :user_id => 1 }
  new_projects << {:name => "1103_BBB_Building", :user_id => 2 }
  new_projects << {:name => "1205_LNA_STAIR", :user_id => 3 }
  new_projects << {:name => "1116_UTS_Great_Hall", :user_id => 4 }
  new_projects << {:name => "1102_MTA_Broadway", :user_id => 1 }
  new_projects << {:name => "1103_GPT_Tower", :user_id => 2 }
  new_projects << {:name => "1206_MPK_facade", :user_id => 3 }
  new_projects << {:name => "1117_GCI_Castlereagh", :user_id => 4 }
  
  new_projects.each do |new_project_hash|
    p = Project.new(new_project_hash)
    # p.save!(:validate => false)
    # All projects are shared with user 1
    p.users << User.find(1)
    print "Creating Project #{p.name} belongs to #{p.user_id}. "

    if p.valid?
      p.save!()
      print "... Created ! id : #{p.id}  "
      current_user = User.find(p.user_id)
      params = {}
      params[:project_id] = p.id
      # Populate sample drawings
      (1..10).each do |i|

        drawing_name = "#{p.name}_DRW_#{i.to_s.rjust(3,"0")}"
        attachment = File.open("/Users/Thang/Dropbox/GA_BEWD/armaSearch/db/sample_database/TEMPLATE/drawings/SAMPLE_DRAWING.pdf")
        new_drawing = p.drawings.create({:name => drawing_name, :attachment => attachment})
        new_drawing.is_part = false
        if new_drawing.valid?
          new_drawing.save!
          puts new_drawing.attachment.url
          puts "Sample drawing created"
        else
          puts "Drawing already exist"
        end
      end

      # Populate sample parts
      (1..10).each do |i|

        drawing_name = "#{p.name}_PRT_#{i.to_s.rjust(3,"0")}"
        attachment = File.open("/Users/Thang/Dropbox/GA_BEWD/armaSearch/db/sample_database/TEMPLATE/parts/SAMPLE_PART.pdf")
        new_drawing = p.drawings.create({:name => drawing_name, :attachment => attachment})
        new_drawing.is_part = true

        if new_drawing.valid?
          new_drawing.save!
          if new_drawing.is_part
            new_part = p.parts.create({:name => drawing_name})

            new_part.drawing_id = new_drawing.id
            if new_part.save!
              puts "Sample part created"

            end
          end
        else
          puts "Drawing already exist"
        end
      end

    else
      print p.errors.messages
    end
    puts ""
  end
  # Seeding Drawings
  #Drawing.create(id: integer, number: integer, created_at: datetime, updated_at: datetime, project: integer, title: string, series: string, revision: string, attachment_file_name: string, attachment_content_type: string, attachment_file_size: integer, attachment_updated_at: datetime, project_id: integer, slug: string) 
  #Drawing.create(id: integer, created_at: datetime, updated_at: datetime, project: integer, name: string, title: string, series: string, revision: string, is_part: boolean, attachment_file_name: string, attachment_content_type: string, attachment_file_size: integer, attachment_updated_at: datetime, project_id: integer, slug: str

# project = Project.find("1205_LH_STAIR".downcase)


# Seeding Parts - not necessary as Drawing will create part automatically if it has has_part as true.
# Part.create(id: integer, created_at: datetime, updated_at: datetime, number: string, assembly: integer, drawing_id: integer, slug: string) 
# Part.create(id: integer, created_at: datetime, updated_at: datetime, number: string, assembly_id: integer, drawing_id: integer, slug: string) 