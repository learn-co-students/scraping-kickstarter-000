# require libraries/modules here
require 'nokogiri'

#projects: kickstarter.css("li.project.grid_4")
#title: project.css("h2.bbcard_name strong a").text
#image-link: project.css("div.project-thumbnail a img").attribute("src").value
#description: project.css("p.bbcard_blurb").text
#location: project.css("ul.project-meta span.location-name").text
#percent_funded: project.css("li.first.funded span").text.gsub("%","").to_i

def create_project_hash
  # use local copy instead of open-uri's open() method
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  projects = kickstarter.css("li.project.grid_4")
  projects.each_with_object({}) do |project, res|
    title = project.css("h2.bbcard_name strong a").text
    res[title] = {
    	:image_link => project.css("div.project-thumbnail a img").attribute("src").value,
    	:description => project.css("p.bbcard_blurb").text,
    	:location => project.css("span.location-name").text,
    	:percent_funded => project.css("li.first.funded span").text.gsub("%", "").to_i   
    }
  end	
end
