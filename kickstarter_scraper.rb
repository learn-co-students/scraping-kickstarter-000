# require libraries/modules here
require 'nokogiri'
require 'pry'
# require 'open-uri' :: Don't need this because in order
# to do this lesson, they've given us the URL frozen in time so that everyone is working
# w/ the same data.

# projects: kickstarter.css("li.project.grid_4")
# title: project.css("h2.bbcard_name strong a").text
# image link: project.css("div.project-thumbnail a img").attribute("src").value
# description: project.css("p.bbcard_blurb").text
# location: project.css("ul.project-meta span.location-name").text
# percent_funded: project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i

def create_project_hashhhhhhhhhh

html = File.read('fixtures/kickstarter.html')
kickstarter = Nokogiri::HTML(html)

projects = {}

  # # Iterate through the projects
  # kickstarter.css("li.project.grid_4").each do |project|
  #   projects[project] = {}
  # end

    # # return the projects hash
    # projects

  # Ok, so that won't work, actually. That's going to make some really wacky key which is a huge Nokogiri object. So, let's change our data structure slightly and make it so that each project title is a key, and the value is another hash with each of our other data points as keys. Sound good?


end



def create_project_hash

html = File.read('fixtures/kickstarter.html')
kickstarter = Nokogiri::HTML(html)

projects = {}


    kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text
    projects[title] = {
      :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
      :description => project.css("p.bbcard_blurb").text,
      :location => project.css("ul.project-meta span.location-name").text,
      :percent_funded => project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
    }
  end

  # return the projects hash
  projects
end



















