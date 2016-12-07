require "csv"

class Scraping
  def self.save_music
    puts 'get movies link URL'
    home = "http://vocaran.jpn.org/vocaran/"
    links = []
    agent = Mechanize.new
    for i in 464..474 do 
      page = agent.get(home + i.to_s)
      elements = page.search(".title a")
      elements.each do |link|
        binding.pry
        nico = agent.get(link[:href])
        title = span[:alt]
        image_url = span[:src]
        music = Music.where(title:title,image_url:image_url).first_or_initialize
        music.save
      end
    end
  end

  def self.delete_music
    musics = Music.all
    musics.each do |music|
      music.destroy
    end
  end

  def self.read_csv_to_database
    csv_data = CSV.table("/Users/tech-camp/Documents/Python/musics.csv", headers: true)
    csv_data.each do |data|
      title = data[:title]
      image = data[:image]
      music = Music.where(title:title,image_url:image).first_or_initialize
      music.save
    end
  end
end